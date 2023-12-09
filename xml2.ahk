#Requires AutoHotkey v2.0

class xml 
{
	static load(src) {
		if FileExist(src) {
			data := FileRead(src)
		} else {
			data := src
		}
		oXML := ComObject("MSXML2.DOMDocument.6.0")
		oXML.Async := false
		oXML.loadXML(data)
	
		return oXML
	}

	static getAtt(element,id) {
		
	}
	
}
