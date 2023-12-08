#Requires AutoHotkey v2.0

class xml 
{
	__New(src:="") {
		static MSXML := "MSXML2.DOMDocument.6.0"
		
		this.doc := ComObject(MSXML)
		if FileExist(src) {
			data := FileRead(src)
		} else {
			data := src
		}
		this.doc.loadXML(data)
	}
}
