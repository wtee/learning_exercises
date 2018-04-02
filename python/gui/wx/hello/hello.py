import wx

# Based on the example code for Hello World, part 2 found
# here https://wxpython.org/pages/overview/#hello-world

class HelloFrame(wx.Frame):
    def __init__(self, *args, **kwargs):
        super(HelloFrame, self).__init__(*args, **kwargs)
        
        panel = wx.Panel(self)

        text = wx.StaticText(panel, label='Hello World', pos=(25, 25), size=panel.Size)
        font = text.GetFont()
        font.PointSize += 10
        font = font.Bold()
        text.SetFont(font)

        self.makeMenuBar()

        self.CreateStatusBar()
        self.SetStatusText('Hello, wxPython!')


    def makeMenuBar(self):
        fileMenu = wx.Menu()
        helloItem = fileMenu.Append(-1, '&Hello...\tCtrl-H', 'Say hello!')
        fileMenu.AppendSeparator()
                 

        exitItem = fileMenu.Append(wx.ID_EXIT)

        helpMenu = wx.Menu()
        aboutItem = helpMenu.Append(wx.ID_ABOUT)

        menuBar = wx.MenuBar()
        menuBar.Append(fileMenu, '&File')
        menuBar.Append(helpMenu, '&Help')

        self.SetMenuBar(menuBar)

        self.Bind(wx.EVT_MENU, self.OnHello, helloItem)
        self.Bind(wx.EVT_MENU, self.OnExit, exitItem)
        self.Bind(wx.EVT_MENU, self.OnAbout, aboutItem)

    def OnExit(self, event):
        self.Close(True)

    def OnHello(self, event):
        wx.MessageBox('Hello again!')

    def OnAbout(self, event):
        wx.MessageBox('This is a "Hello World" example using wxPython',
                      'About Hello World 2',
                      wx.OK|wx.ICON_INFORMATION)

if __name__ == '__main__':
    app = wx.App()
    frame = HelloFrame(None, title="Hello World 2")
    frame.Show()
    app.MainLoop()