#Requires AutoHotkey v2.0

class xml
{
/*	First usable version 2023-12-10
	* new
	* addElement
	* insertElement
*/
	static new(src:="") {
		this.doc := ComObject("MSXML2.DOMDocument.6.0")
		if src {
			if (src ~= "s)^<.*>$") {
				this.doc.loadXML(src)
			}
			else if FileExist(src) {
				this.doc.load(src)
			}
			return this.doc
		} 
	}

	static addElement(node,child,params*) {
	/*	Appends new child to node object
		Object must have valid parentNode
		Creates new XML blank ComObject to avoid messing up other instances
		Optional params:
			text gets added as text
			@attr1='abc', trims outer '' chars
			@attr2='xyz'
	*/
		try IsObject(node.ParentNode) 
		catch as err {
			MsgBox("Error: " err.Message)
		} 
		else {
			n := ComObject("MSXML2.DOMDocument.6.0")
			newElem := n.createElement(child)
			for p in params {
				if IsObject(p) {
					for key,val in p.OwnProps() {
						newElem.setAttribute(key,val)
					}
				} else {
					newElem.text := p
				}
			}
			node.appendChild(newElem)
			n := ""
		}
	}
	static insertElement(node,new,params*) {
	/*	Inserts new element above node object
		Object must have valid parentNode
	*/
		try IsObject(node.ParentNode) 
		catch as err {
			MsgBox("Error: " err.Message)
		} 
		else {
			n := ComObject("MSXML2.DOMDocument.6.0")
			newElem := n.createElement(new)
			for p in params {
				if IsObject(p) {
					for key,val in p.OwnProps() {
						newElem.setAttribute(key,val)
					} 
				} else {
					newElem.text := p
				}
			}
			node.parentNode.insertBefore(newElem,node)
			n := ""
		}
	}
	static getText(node) {
	/*	Checks whether node exists to fetch text
	*/
		if IsObject(node) {
			txt := node.text
		} else {
			txt := ""
		}
		return txt
	}
}