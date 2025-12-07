#NoEnv 
#SingleInstance Force
SendMode Input   

; --------- DÉFINITION DES PSEUDOS (ORDRE D'INITIATIVE) ---------
Pseudo_1 := "Holy-Wood - Cra"
Pseudo_2 := "Holy-Qc - Enutrof"
Pseudo_3 := "Holy-day - Enutrof"
Pseudo_4 := "Holy-tchi - Pandawa"	 

; --------- VARIABLES POUR LA GESTION DU GUI ---------
isAltPressed := false
isButtonClicked := false
LastActiveWindow := ""
CurrentIndex := 1

; --------- CONSTRUCTION DU GUI ---------
Gui, +AlwaysOnTop -Caption +ToolWindow
Gui, Font, s10
Gui, Add, Button, gP1 w150 x10 y+5, 1 - %Pseudo_1%
Gui, Add, Button, gP2 w150 x10 y+5, 2 - %Pseudo_2%
Gui, Add, Button, gP3 w150 x10 y+5, 3 - %Pseudo_3%
Gui, Add, Button, gP4 w150 x10 y+5, 4 - %Pseudo_4%
Gui, Show, Hide AutoSize Center

; --------- POSITION SUR ÉCRAN 2 ---------
MonitorNum := 1  ; Change ce numéro pour choisir l'écran

SysGet, Mon, Monitor, %MonitorNum%
SysGet, MonWork, MonitorWorkArea, %MonitorNum%

; Calcul du centre de l'écran 2
Gui, Show, Hide AutoSize  ; D'abord on dimensionne le GUI
WinGetPos, , , GuiWidth, GuiHeight, A

CenterX := MonWorkLeft + ((MonWorkRight - MonWorkLeft - GuiWidth) // 2)
CenterY := MonWorkTop + ((MonWorkBottom - MonWorkTop - GuiHeight) // 2)

Gui, Show, Hide x%CenterX% y%CenterY%  ; Position finale cachée


Loop, 4 {
    thisPseudo := Pseudo_%A_Index%
    if WinExist(thisPseudo) {
        GuiControl, Enable, Button%A_Index%
    } else {
        GuiControl, Disable, Button%A_Index%
    }
}

return  ; <====== CRUCIAL ! Empêche l'exécution des labels ci-dessous

; --------- BOUTONS DU GUI ---------
P1:
    isButtonClicked := true
    CurrentIndex := 1
    WinActivate, % Pseudo_1
return

P2:
    isButtonClicked := true
    CurrentIndex := 2
    WinActivate, % Pseudo_2
return

P3:
    isButtonClicked := true
    CurrentIndex := 3
    WinActivate, % Pseudo_3
return

P4:
    isButtonClicked := true
    CurrentIndex := 4
    WinActivate, % Pseudo_4
return

; --------- ALT ENFONCÉ : Affiche le menu ---------
LAlt::
    if (isAltPressed)
        return
    isAltPressed := true
    isButtonClicked := false
    WinGetActiveTitle, LastActiveWindow
    Loop, 4 {
        thisPseudo := Pseudo_%A_Index%
        if InStr(LastActiveWindow, thisPseudo) {
            CurrentIndex := A_Index
            break
        }
    }
    Gui, Show, x%CenterX% y%CenterY%  ; <-- Ajoute les coordonnées ici
return

; --------- ALT RELÂCHÉ : Cache le menu et agit si aucun clic ---------
~LAlt Up::
    Gui, Hide
    
    if (isButtonClicked) {
        isAltPressed := false
        isButtonClicked := false
        return
    }
    
    ; Passer au prochain pseudo
    GoSub, NextPerso
    isAltPressed := false
return

; --------- Passer au prochain pseudo ---------
NextPerso:
    CurrentIndex := CurrentIndex + 1
    if (CurrentIndex > 4)
        CurrentIndex := 1
    
    nextPseudo := Pseudo_%CurrentIndex%
    WinActivate, % nextPseudo
return

; --------- CLIC MOLETTE → CLIC SUR CHAQUE FENÊTRE ---------
MButton::
    MouseGetPos, x, y
    
    WinActivate, %Pseudo_1%
    Click, %x%, %y%
    Sleep, 57
    
    WinActivate, %Pseudo_2%
    Click, %x%, %y%
    Sleep, 42
    
    WinActivate, %Pseudo_3%
    Click, %x%, %y%
    Sleep, 53
    
    WinActivate, %Pseudo_4%
    Click, %x%, %y%
	Sleep, 57

	WinActivate, %Pseudo_1%

return