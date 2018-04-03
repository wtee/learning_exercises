import wx
import wx.html2

local_page = """
<!doctype html>
<html>
    <head>
        <title>Hello, HTML!</title>
        <style>
        .heading {
            font-size: 5rem;
            color: blue;
        }

        .body-text {
            color: red;
        }
        </style>
    </head>
    <body>
        <h1 class="heading">Hello, HTML!</h1>
        <p class="body-text">Look, I can render HTML in a window.</p>
    </body>
</html>
"""

class webView(wx.Frame):
    def __init__(self, *args, **kwargs):
        super(webView, self).__init__(*args, **kwargs)
        self.browser = wx.html2.WebView.New(self)
        sizer = wx.BoxSizer()
        sizer.Add(self.browser, 1, wx.EXPAND, 10)
        self.SetSizer(sizer) 
        self.SetSize((700, 700))
        self.Bind(wx.EVT_CLOSE, self.OnExit)
    def OnExit(self, event):
        self.Destroy()


if __name__ == '__main__':
    app = wx.App()
    frame = webView(None, -1, title="Hi!")
    frame.browser.SetPage(local_page, '')
    frame.Show()
    app.MainLoop()



