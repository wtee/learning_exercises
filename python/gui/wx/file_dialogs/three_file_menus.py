import wx

class FileOpenerWindow(wx.Frame):
    def __init__(self, *args, **kwargs):
        super(FileOpenerWindow, self).__init__(*args, **kwargs)

        panel = wx.Panel(self)

        btn_width = 100 
        
        file_btn_a = wx.Button(panel, label='File 1', pos=(5, 15), size=(btn_width, 20))
        file_btn_b = wx.Button(panel, label='File 2', pos=(10 + btn_width, 15), size=(btn_width, 20))
        file_btn_c = wx.Button(panel, label='File 3', pos=(15 + btn_width * 2, 15), size=(btn_width, 20))

        file_btn_a.name = 'a'
        file_btn_b.name = 'b'
        file_btn_c.name = 'c'

        file_btn_a.Bind(wx.EVT_BUTTON, self.openFileDialog)
        file_btn_b.Bind(wx.EVT_BUTTON, self.openFileDialog)
        file_btn_c.Bind(wx.EVT_BUTTON, self.openFileDialog)

        self.file_a = ''
        self.file_b = ''
        self.file_c = ''

        self.text = wx.StaticText(panel, label='Hello, Files', pos=(5, 50))

    def openFileDialog(self, event):
        with wx.FileDialog(self, 'Open a file to compare.', 
                           style=wx.FD_OPEN | wx.FD_FILE_MUST_EXIST) as fd:
            
            if fd.ShowModal() == wx.ID_CANCEL:
                return

            pathname = fd.GetPath()
            btn_pressed = event.GetEventObject()

            try:
                with open(pathname, 'r') as fh:
                    self.readFile(fh, btn_pressed.name)

                # Set the button label to file path
                btn_pressed.SetLabel(pathname)
            except IOError:
                wx.LogError(f'Cannot open {pathname}')

    # The window doesn't expand when setting the text label to something
    # wider or longer than the initial frame size, but since that's not really
    # what I'm experimenting with here, that's fine.
    def readFile(self, fh, fn):
        if fn == 'a':
            self.file_a = fh.read()
            self.text.SetLabel(self.file_a)
        elif fn == 'b':
            self.file_b = fh.read()
            self.text.SetLabel(self.file_b)
        elif fn == 'c':
            self.file_c = fh.read()
            self.text.SetLabel(self.file_c)


if __name__ == '__main__':
    app = wx.App()
    frame = FileOpenerWindow(None, title="File World", size=(335, 900))
    frame.Show()
    app.MainLoop()
