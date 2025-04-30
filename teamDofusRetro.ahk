#NoEnv 
#SingleInstance Force
SendMode Input   

; --------- DÉFINITION DES PSEUDOS (ORDRE D’INITIATIVE) ---------
Pseudo_1 := "ENTRER VOTRE PSEUDO ICI"
Pseudo_2 := "ENTRER VOTRE PSEUDO ICI"
Pseudo_3 := "ENTRER VOTRE PSEUDO ICI"
Pseudo_4 := "ENTRER VOTRE PSEUDO ICI"	 
Pseudo_5 := "ENTRER VOTRE PSEUDO ICI"
Pseudo_6 := "ENTRER VOTRE PSEUDO ICI"
Pseudo_7 := "ENTRER VOTRE PSEUDO ICI" 
Pseudo_8 := "ENTRER VOTRE PSEUDO ICI"


; --------- DÉFINITION DES COORDONNÉES PASSER TOUR (Attention ne pas lancer spectateur si hors combat) ---------
x1 := 1443
y1 := 1005

; --------- DÉFINITION DES COORDONNÉES FAIRE PRÊT ---------
x2 := 1886
y2 := 764

; --------- VARIABLES POUR LA GESTION DU GUI ---------
isAltPressed := false
isButtonClicked := false

; --------- CONSTRUCTION DU GUI ---------
Gui, +AlwaysOnTop -Caption +ToolWindow  ; GUI sans bordure, toujours visible
Gui, Font, s10

Gui, Add, Button, gP1 w150 x10 y+5, 1 - %Pseudo_1%
Gui, Add, Button, gPass1 w60 x+10 yp, Passer

Gui, Add, Button, gP2 w150 x10 y+5, 2 - %Pseudo_2%
Gui, Add, Button, gPass2 w60 x+10 yp, Passer

Gui, Add, Button, gP3 w150 x10 y+5, 3 - %Pseudo_3%
Gui, Add, Button, gPass3 w60 x+10 yp, Passer

Gui, Add, Button, gP4 w150 x10 y+5, 4 - %Pseudo_4%
Gui, Add, Button, gPass4 w60 x+10 yp, Passer

Gui, Add, Button, gP5 w150 x10 y+5, 5 - %Pseudo_5%
Gui, Add, Button, gPass5 w60 x+10 yp, Passer

Gui, Add, Button, gP6 w150 x10 y+5, 6 - %Pseudo_6%
Gui, Add, Button, gPass6 w60 x+10 yp, Passer

Gui, Add, Button, gP7 w150 x10 y+5, 7 - %Pseudo_7%
Gui, Add, Button, gPass7 w60 x+10 yp, Passer

Gui, Add, Button, gP8 w150 x10 y+5, 8 - %Pseudo_8%
Gui, Add, Button, gPass8 w60 x+10 yp, Passer

Gui, Add, Button, gPret x10 w220, Prêt

Gui, Show, Hide AutoSize Center         ; Le GUI est caché au départ


; --------- BOUTONS DU GUI ---------
P1:
	isButtonClicked := true
	WinActivate, % Pseudo_1
	return

P2:
	isButtonClicked := true
	WinActivate, % Pseudo_2
	return

P3:
	isButtonClicked := true
	WinActivate, % Pseudo_3
	return

P4:
	isButtonClicked := true
	WinActivate, % Pseudo_4
	return

P5:
	isButtonClicked := true
	WinActivate, % Pseudo_5
	return


P6:
	isButtonClicked := true
	WinActivate, % Pseudo_6
	return

P7:
	isButtonClicked := true
	WinActivate, % Pseudo_7
	return

P8:
	isButtonClicked := true
	WinActivate, % Pseudo_8
	return

; --------- ALT ENFONCÉ : Affiche le menu ---------
LAlt::
    if (isAltPressed)
        return
    isAltPressed := true
    isButtonClicked := false

    ; Vérifie l'existence des fenêtres et active/désactive les boutons
    Loop, 8 {
        thisPseudo := Pseudo_%A_Index%
        if WinExist(thisPseudo) {
            GuiControl, Enable, Button%A_Index%
        } else {
            GuiControl, Disable, Button%A_Index%
		}
	}
    Gui, Show
return




; --------- ALT RELÂCHÉ : Cache le menu et agit si aucun clic ---------
LAlt Up::
    ; Si le GUI a été fermé par un clic (isButtonClicked = true), on ne fait rien
    if (GuiCloseAction || isButtonClicked) {
        isAltPressed := false
        isButtonClicked := false
		Gui, Hide
        return
    }
    
    ; Sinon, on change de pseudo normalement
    Gui, Hide
    GoSub, NextPerso
    isAltPressed := false
return

; --------- LOGIQUE DE F3 : Passer au prochain pseudo ---------
NextPerso:
IfWinActive, % Pseudo_1
    WinActivate, % Pseudo_2
else IfWinActive, % Pseudo_2
    WinActivate, % Pseudo_3
else IfWinActive, % Pseudo_3
    WinActivate, % Pseudo_4
else IfWinActive, % Pseudo_4
    WinActivate, % Pseudo_5
else IfWinActive, % Pseudo_5
    WinActivate, % Pseudo_6
else IfWinActive, % Pseudo_6
    WinActivate, % Pseudo_7
else IfWinActive, % Pseudo_7
    WinActivate, % Pseudo_8
else
    WinActivate, % Pseudo_1
return

; --------- LOGIQUE DE F2 : Retour au pseudo précédent ---------
PrevPerso:
IfWinActive, % Pseudo_8
    WinActivate, % Pseudo_7
else IfWinActive, % Pseudo_7
    WinActivate, % Pseudo_6
else IfWinActive, % Pseudo_6
    WinActivate, % Pseudo_5
else IfWinActive, % Pseudo_5
    WinActivate, % Pseudo_4
else IfWinActive, % Pseudo_4
    WinActivate, % Pseudo_3
else IfWinActive, % Pseudo_3
    WinActivate, % Pseudo_2
else IfWinActive, % Pseudo_2
    WinActivate, % Pseudo_1
else
    WinActivate, % Pseudo_8
return

Pass1:
	ControlClick, x%x1% y%y1%, %Pseudo_1%, , Left, 1, NA
	isButtonClicked := true
return

Pass2:
	ControlClick, x%x1% y%y1%, %Pseudo_2%, , Left, 1, NA
	isButtonClicked := true

return

Pass3:
	ControlClick, x%x1% y%y1%, %Pseudo_3%, , Left, 1, NA
	isButtonClicked := true

return

Pass4:
	ControlClick, x%x1% y%y1%, %Pseudo_4%, , Left, 1, NA
	isButtonClicked := true
return

Pass5:
	ControlClick, x%x1% y%y1%, %Pseudo_5%, , Left, 1, NA
	isButtonClicked := true
return

Pass6:
	ControlClick, x%x1% y%y1%, %Pseudo_6%, , Left, 1, NA
	isButtonClicked := true
return

Pass7:
	ControlClick, x%x1% y%y1%, %Pseudo_7%, , Left, 1, NA
	isButtonClicked := true
return

Pass8:
	ControlClick, x%x1% y%y1%, %Pseudo_8%, , Left, 1, NA
	isButtonClicked := true
return

Pret:
	ControlClick, x%x2% y%y2%, %Pseudo_1%, , Left, 1, NA
	ControlClick, x%x2% y%y2%, %Pseudo_2%, , Left, 1, NA
	ControlClick, x%x2% y%y2%, %Pseudo_3%, , Left, 1, NA
	ControlClick, x%x2% y%y2%, %Pseudo_4%, , Left, 1, NA
	ControlClick, x%x2% y%y2%, %Pseudo_5%, , Left, 1, NA
	ControlClick, x%x2% y%y2%, %Pseudo_6%, , Left, 1, NA
	ControlClick, x%x2% y%y2%, %Pseudo_7%, , Left, 1, NA
	ControlClick, x%x2% y%y2%, %Pseudo_8%, , Left, 1, NA
	isButtonClicked := true
return


; --------- RACCOURCIS POUR ACTIVER CHAQUE PSEUDO DIRECTEMENT ---------
/* Ceci était ma première version, je ne l'utilise plus depuis que j'ai implanté le GUI
F2::GoSub, PrevPerso
F3::GoSub, NextPerso
F4::GoSub, P1
F5::GoSub, P2
F6::GoSub, P3
F7::GoSub, P4
F8::GoSub, P5
F9::GoSub, P6
F10::GoSub, P7
F11::GoSub, P8
*/

; --------- CLIC MOLETTE → CLIC SUR CHAQUE FENÊTRE ---------
MButton::
MouseGetPos, x, y  ; Position de la souris
Loop, 8 {
    thisPseudo := Pseudo_%A_Index%
    if WinExist(thisPseudo) {
        WinGetPos, winX, winY,,, %thisPseudo%  ; Position fenêtre
        relX := x - winX
        relY := y - winY
        ControlClick, x%relX% y%relY%, %thisPseudo%, , Left, 1, NA

        Random, delay, 250, 500
        Sleep, delay ;Ajoute un délais pour simuler un clic humain
    }
}
return
