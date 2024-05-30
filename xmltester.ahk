#Requires AutoHotkey v2

data := "
(
<?xml version="1.0" encoding="UTF-8"?>
<root>
	<pending update="20231109081007">
		<enroll id="2DIX1W13TQCB">
			<date>20240213</date>
			<name>MAXIMUS, GLUTEUS</name>
			<mrn>1511076</mrn>
			<sex>Male</sex>
			<dob>08/19/2002</dob>
		</enroll>
		<enroll id="2E02ZD8T4CZ2">
			<date>20231030</date>
			<name>RABBIT, PETER</name>
			<mrn>1053167</mrn>
			<sex>Male</sex>
			<dob>08/26/2006</dob>
		</enroll>
		<enroll id="2DJ7JL7KDA17">
			<date>20220623</date>
			<name>LINCOLN, ABE</name>
			<mrn>2043565</mrn>
			<sex>Male</sex>
			<dob>10/06/2007</dob>
		</enroll>
	</pending>
</root>
)"

oXML := XML.new(data)
en := oXML.selectNodes("//enroll")
num := en.Length
pnd := oXML.selectSingleNode("//enroll[@id='2DIX1W13TQCB']")
name := pnd.selectSingleNode("name").Text
id := pnd.getAttribute("id")

XML.addElement(pnd,"newnode","this")
pnd2 := pnd.selectSingleNode("newnode")
update := XML.getText(pnd2)

ExitApp

class XML
{
/*	new() = return new XML document
	addElement() = append new element to node object
	insertElement() = insert new element above node object
	getText() = return element text if present
*/
	static new(src:="") {
		this.doc := ComObject("MSXML2.DOMDocument")
		if (src) {
			if (src ~= "s)^<.*>$") {
				this.doc.loadXML(src)
			} 
			else if FileExist(src) {
				this.doc.load(src)
			}
		}
		return this.doc
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
		try {
			IsObject(node.ParentNode)
		} 
		catch as err {
			MsgBox("Error: " err.Message)
		} 
		else {
			n := ComObject("MSXML2.DOMDocument")
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
		try {
			IsObject(node.ParentNode)
		}
		catch as err {
			MsgBox("Error: " err.Message)
		} 
		else {
			n := ComObject("MSXML2.DOMDocument")
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
		try {
			return node.text
		} catch {
			return ""
		}
	}
}