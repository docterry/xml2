#Requires AutoHotkey v2.0

fnam := "worklist.xml"
data := FileRead(fnam)
oXML := xml.new(fnam)
en := oXML.selectNodes("//enroll")
num := en.Length
pnd := oXML.selectSingleNode("//enroll[@id='6RD4YMGS39']")
update := pnd.selectSingleNode("dev").Text
id := pnd.getAttribute("id")
xml.addElement(pnd,"newnode","value here","@date='2019=47'" )
pnd2 := pnd.selectSingleNode("newnode")
xml.insertElement(pnd2,"newish")

oXML.save("worklist2.xml")

ExitApp

#Include xml2.ahk
