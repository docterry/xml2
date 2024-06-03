#Requires AutoHotkey v2.0

fnam := "simple.xml"
data := FileRead(fnam)
oXML := XML(fnam)
en := oXML.selectNodes("//enroll")
num := en.Length
pnd := oXML.selectSingleNode("//enroll[@id='user1']")
update := pnd.selectSingleNode("date").Text
id := pnd.getAttribute("id")
oXML.addElement(pnd,"newnode","value here",{date:A_now,last:'2022 "best" year'} )
pnd2 := pnd.selectSingleNode("newnode")
oXML.insertElement(pnd2,"newish")

pnd3 := oXML.selectSingleNode("//enroll[@id='user1']/sex")
oXML.findXPath(pnd3)

oXML.saveXML()

ExitApp

#Include xml2.ahk
