#include "main.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

//        QQmlApplicationEngine engine;
//        engine.load(QUrl(QStringLiteral("qrc:/mainWindow.qml")));

    LikeAndroidUtils *likeAndroidUtils = new LikeAndroidUtils();

    QQmlApplicationEngine qmlEngine;
    QQmlComponent component(&qmlEngine, QUrl(QStringLiteral("qrc:/mainWindow.qml")));
    QObject *rootObj = component.create();


//    QObject *introText;
//    QObject *emailText;
//    QObject *btnStart;

//    introText = likeAndroidUtils->findViewByObjName(rootObj,"introText");
//    emailText = likeAndroidUtils->findViewByObjName(rootObj,"emailText");
//    btnStart = likeAndroidUtils->findViewByObjName(rootObj,"btnStart");

//    if (introText) {
//        introText->setProperty("color","yellow");
//    }
//    if (emailText) {
//        emailText->setProperty("text","test text");
//    }

//    if (btnStart) {

//    }
    return app.exec();
}


