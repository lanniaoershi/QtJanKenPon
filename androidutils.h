#ifndef ANDROIDUTILS_H
#define ANDROIDUTILS_H
#include "main.h"

class LikeAndroidUtils
{
public:
    LikeAndroidUtils();
    ~LikeAndroidUtils();
    QObject *findViewByObjName(QObject *rootView, QString childObjName) {
        QObject *child = rootView->findChild<QObject*>(childObjName);
        return child;
    }
};
LikeAndroidUtils::LikeAndroidUtils(){

}




#endif // ANDROIDUTILS_H
