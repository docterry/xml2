#Requires AutoHotkey v2.0

q := XA.XA_Load(XA.XA_Save(["123"]), 1)
; XA.XA_Load(Filename)

; fnam := "worklist.xml"
; data := FileRead(fnam)
; oXML := xml.load(fnam)
; en := oXML.selectNodes("//enroll")
; num := en.Length
; oXML.getAtt("id")
; pnd := oXML.selectSingleNode("//enroll[@id='6RD4YMGS39']")
; update := pnd.selectSingleNode("dev").Text
; id := pnd.getAttribute("id")
; xml.getAtt("enroll","id")

ExitApp

#Include xml2.ahk
