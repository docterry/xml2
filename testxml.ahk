#Requires AutoHotkey v2.0

fnam := ".\data\simple.xml"
data := FileRead(fnam)
oXML := XML(fnam)
en := oXML.selectNodes("//enroll")
num := en.Length

pnd := oXML.selectSingleNode("//enroll[@id='user1']")
pnd := oXML.selectSingleNode("//enroll[name='RABBIT, PETER']")
update := pnd.selectSingleNode("date").Text
id := pnd.getAttribute("id")

pnd2 := oXML.addElement(pnd,"newnode","value here",{date:A_now,last:'2022 "best" year'} )
; pnd2 := pnd.addElement("newnode","value here",{date:A_now,last:'2022 "best" year'})
OutputDebug oXML.findXPath(pnd2)

pnd3 := oXML.insertElement(pnd2,"newish")
oXML.setAtt(pnd3,{item:5, color:"blue"})
pnd3.setAttribute("color","&quot;red&quot;")
; pnd2.setAttribute()

; pnd3 := oXML.selectSingleNode("//enroll[@id='user1']/gender")
; oXML.removeNode(pnd3)
; oXML.findXPath(pnd3)

; oXML.setText(pnd3,"Undetermined")

oXML.saveXML(".\data\" A_Now ".xml")

ExitApp

#Include xml2.ahk
