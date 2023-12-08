#Requires AutoHotkey v2.0

loadXML(src) {
/*  
*/
    if FileExist(src) {
        data := FileRead(src)
    } else {
        data := src
    }
    oXML := ComObject("Msxml2.DOMDocument.6.0")
    oXML.loadXML(data)
    
    return oXML
}
