#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngineCore>
#include <QtWebEngineQuick>

int main(int argc, char *argv[])
{
    QtWebEngineQuick::initialize();

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/multimediatest/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
