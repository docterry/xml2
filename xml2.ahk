#Requires AutoHotkey v2.0

class xml
{
	__New(src:="") {
		this.doc := ComObject("MSXML2.DOMDocument.6.0")
		if src {
			if (src ~= "s)^<.*>$") { ; XML string
				this.doc.loadXML(src)
			}
			else if (src ~= "[^<>:`"/\\|?*]+\.[^<>:`"/\\|?*\s]+$") {
				if FileExist(src) { ; Path/URL to XML file/resource
					this.doc.load(src)
				}
			} 
		}
	}
	__Get(property,parms*) {
		return this.xml.doc
	}
	; __Set(Key, Params, Value) {
	; 	MsgBox()
	; }
	; __Call(Name, Params) {
	; 	MsgBox()
	; }

	static new(src:="") {
		this.doc := ComObject("MSXML2.DOMDocument.6.0")
		if src {
			if (src ~= "s)^<.*>$") { ; XML string
				this.doc.loadXML(src)
			}
			else if (src ~= "[^<>:`"/\\|?*]+\.[^<>:`"/\\|?*\s]+$") {
				if FileExist(src) { ; Path/URL to XML file/resource
					this.doc.load(src)
				}
			} 
		}
		return this.doc
	}

	static addElement(node,parent) {
		if this {

		}
	}
}
