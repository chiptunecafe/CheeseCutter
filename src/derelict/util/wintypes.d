/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.util.wintypes;

private
{
    import derelict.util.compat;
}

/*
This module is used internally to avoid any dependence upon external Win32 modules.
Considering that there are modules in Phobos, Tango, and the Bindings project at
DSource, we want to avoid any conflicts with whichever implementation Derelict users choose.
*/
version(Windows)
{
    alias uint DWORD;
    alias ushort WORD;
    alias ushort USHORT;
    alias uint UINT;
    alias int INT;
    alias int LONG;
    alias ubyte BYTE;
    alias float FLOAT;
    alias int BOOL;
    alias DWORD COLORREF;

    alias CCPTR LPCSTR;
    alias void* LPVOID;

    alias void* HANDLE;
    alias HANDLE HDC;
    alias HANDLE HGLRC;
    alias HANDLE HINSTANCE;
    alias HANDLE HMODULE;
    alias HANDLE HWND;
    alias HANDLE HLOCAL;
    alias HANDLE HPALETTE;
    alias HANDLE HBITMAP;

    alias UINT WPARAM;
    alias LONG LPARAM;

    alias int function() FARPROC;

    struct LAYERPLANEDESCRIPTOR
    {
        WORD nSize;
        WORD nVersion;
        DWORD dwFlags;
        BYTE iPixelType;
        BYTE cColorBits;
        BYTE cRedBits;
        BYTE cRedShift;
        BYTE cGreenBits;
        BYTE cGreenShift;
        BYTE cBlueBits;
        BYTE cBlueShift;
        BYTE cAlphaBits;
        BYTE cAlphaShift;
        BYTE cAccumBits;
        BYTE cAccumRedBits;
        BYTE cAccumGreenBits;
        BYTE cAccumBlueBits;
        BYTE cAccumAlphaBits;
        BYTE cDepthBits;
        BYTE cStencilBits;
        BYTE cAuxBuffers;
        BYTE iLayerPlane;
        BYTE bReserved;
        COLORREF crTransparent;
    }

    struct POINTFLOAT
    {
        FLOAT x;
        FLOAT y;
    }

    struct GLYPHMETRICSFLOAT
    {
        FLOAT gmfBlackBoxX;
        FLOAT gmfBlackBoxY;
        POINTFLOAT gmfptGlyphOrigin;
        FLOAT gmfCellIncX;
        FLOAT gmfCellIncY;
    }

    struct PIXELFORMATDESCRIPTOR
    {
        WORD  nSize;
        WORD  nVersion;
        DWORD dwFlags;
        BYTE  iPixelType;
        BYTE  cColorBits;
        BYTE  cRedBits;
        BYTE  cRedShift;
        BYTE  cGreenBits;
        BYTE  cGreenShift;
        BYTE  cBlueBits;
        BYTE  cBlueShift;
        BYTE  cAlphaBits;
        BYTE  cAlphaShift;
        BYTE  cAccumBits;
        BYTE  cAccumRedBits;
        BYTE  cAccumGreenBits;
        BYTE  cAccumBlueBits;
        BYTE  cAccumAlphaBits;
        BYTE  cDepthBits;
        BYTE  cStencilBits;
        BYTE  cAuxBuffers;
        BYTE  iLayerType;
        BYTE  bReserved;
        DWORD dwLayerMask;
        DWORD dwVisibleMask;
        DWORD dwDamageMask;
    }

    struct VA_LIST {}

    enum : BYTE
    {
        PFD_TYPE_RGBA                   = 0,
        PFD_TYPE_COLORINDEX             = 1
    }

    enum
    {
        PFD_MAIN_PLANE                  = 0,
        PFD_OVERLAY_PLANE               = 1,
        PFD_UNDERLAY_PLANE              = -1
    }

    enum
    {
        PFD_DOUBLEBUFFER                = 0x00000001,
        PFD_STEREO                      = 0x00000002,
        PFD_DRAW_TO_WINDOW              = 0x00000004,
        PFD_DRAW_TO_BITMAP              = 0x00000008,
        PFD_SUPPORT_GDI                 = 0x00000010,
        PFD_SUPPORT_OPENGL              = 0x00000020,
        PFD_GENERIC_FORMAT              = 0x00000040,
        PFD_NEED_PALETTE                = 0x00000080,
        PFD_NEED_SYSTEM_PALETTE         = 0x00000100,
        PFD_SWAP_EXCHANGE               = 0x00000200,
        PFD_SWAP_COPY                   = 0x00000400,
        PFD_SWAP_LAYER_BUFFERS          = 0x00000800,
        PFD_GENERIC_ACCELERATED         = 0x00001000,
        PFD_SUPPORT_DIRECTDRAW          = 0x00002000,
        PFD_DEPTH_DONTCARE              = 0x20000000,
        PFD_DOUBLBUFFER_DONTCARE        = 0x40000000,
        PFD_STEREO_DONTCARE             = 0x80000000,
    }

    enum
    {
        LANG_NEUTRAL                    = 0,
        SUBLANG_DEFAULT                 = 1,
        FORMAT_MESSAGE_ALLOCATE_BUFFER  = 256,
        FORMAT_MESSAGE_IGNORE_INSERTS   = 512,
        FORMAT_MESSAGE_FROM_SYSTEM      = 4096
    }

    struct RGBQUAD {
        BYTE    rgbBlue;
        BYTE    rgbGreen;
        BYTE    rgbRed;
        BYTE    rgbReserved;
    }

    struct BITMAPINFOHEADER
    {
        DWORD      biSize;
        LONG       biWidth;
        LONG       biHeight;
        WORD       biPlanes;
        WORD       biBitCount;
        DWORD      biCompression;
        DWORD      biSizeImage;
        LONG       biXPelsPerMeter;
        LONG       biYPelsPerMeter;
        DWORD      biClrUsed;
        DWORD      biClrImportant;
    }

    struct BITMAPINFO {
        BITMAPINFOHEADER    bmiHeader;
        RGBQUAD[1]          bmiColors;
    }

    struct RECT
    {
        LONG    left;
        LONG    top;
        LONG    right;
        LONG    bottom;
    }

    extern(Windows)
    {
        int ChoosePixelFormat(HDC,PIXELFORMATDESCRIPTOR*);
        int GetPixelFormat(HDC);
        int DescribePixelFormat(HDC,int,UINT,PIXELFORMATDESCRIPTOR*);
        BOOL SwapBuffers(HDC);

        HMODULE LoadLibraryA(LPCSTR);
        FARPROC GetProcAddress(HMODULE, LPCSTR);
        void FreeLibrary(HMODULE);
        DWORD GetLastError();
        DWORD FormatMessageA(DWORD, in void*, DWORD, DWORD, LPCSTR, DWORD, VA_LIST*);
        HLOCAL LocalFree(HLOCAL);
    }

    DWORD MAKELANGID(WORD p, WORD s)
    {
         return (((cast(WORD)s) << 10) | cast(WORD)p);
    }
}
