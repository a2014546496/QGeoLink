#ifndef FRAMELESSHELPERX11_H
#define FRAMELESSHELPERX11_H

#include <QObject>
#include <QX11Info>
#include <QWindow>
#include <X11/Xlib.h>
#include <X11/Xatom.h>

class FramelessHelperX11 : public QObject
{
    Q_OBJECT
public:
    explicit FramelessHelperX11(QObject *parent = nullptr);

    //窗口四周预留10px;
   Q_INVOKABLE void enableGtkShadow(QWindow * window){
        if(!window) return;

        Display *dpy = QX11Info::display();
        Window wid = window->winId();

        long extents[4] = {10,10,10,10};

        Atom prop = XInternAtom(dpy, "_GTK_FRAME_EXTENTS", False);
        XChangeProperty(dpy, wid, prop, XA_CARDINAL, 32, PropModeReplace,(unsigned char *)extents, 4);
        XFlush(dpy);
    }

    // 阴影贴图
   Q_INVOKABLE void enableKDEShadow(QWindow * window) {
        if(!window) return;

        Display * dpy = QX11Info::display();
        Window wid = window->winId();

        Atom atom = XInternAtom(dpy, "_KDE_NET_WM_SHADOW", False);

        long data[4] = {15,15,40,15};

        XChangeProperty(dpy, wid, atom, XA_CARDINAL, 32, PropModeReplace, (unsigned char *) data, 4);

        XFlush(dpy);
    }


signals:

};

#endif // FRAMELESSHELPERX11_H
