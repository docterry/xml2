#Requires AutoHotkey v2.0

fnam := "worklist.xml"
oXML := xml.load(fnam)
en := oXML.selectNodes("//enroll")
num := en.Length
pnd := oXML.selectSingleNode("//enroll[@id='6RD4YMGS39']")
update := pnd.selectSingleNode("dev").Text
id := pnd.getAttribute("id")
xml.getAtt("enroll","id")

ExitApp

#Include xml2.ahk
