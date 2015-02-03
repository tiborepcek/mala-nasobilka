#NoTrayIcon
Opt("GUICloseOnESC", 0)

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

$Form = GUICreate("Malá násobilka", 493, 222, -1, -1)
$labelNadpis = GUICtrlCreateLabel("Malá násobilka", 15, 15, 460, 30, BitOR($SS_CENTER,$WS_GROUP))
GUICtrlSetFont(-1, 14, 800, 0, "Verdana")
$labelPodnadpis = GUICtrlCreateLabel("verzia: 1.0, autor: Tibor Repček (tiborepcek@windowslive.com)", 15, 43, 460, 22, BitOR($SS_CENTER,$WS_GROUP))
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
$labelCisloVlavo = GUICtrlCreateLabel(Random(0, 10, 1), 43, 110, 35, 22, BitOR($SS_CENTER,$WS_GROUP))
GUICtrlSetFont(-1, 12, 800, 0, "Verdana")
$labelZnakNasobenia = GUICtrlCreateLabel("x", 83, 110, 20, 22, BitOR($SS_CENTER,$WS_GROUP))
GUICtrlSetFont(-1, 12, 800, 0, "Verdana")
$labelCisloVpravo = GUICtrlCreateLabel(Random(0, 10, 1), 105, 110, 35, 22, BitOR($SS_CENTER,$WS_GROUP))
GUICtrlSetFont(-1, 12, 800, 0, "Verdana")
$labelZnakRovnaSa = GUICtrlCreateLabel("=", 142, 107, 20, 22, BitOR($SS_CENTER,$WS_GROUP))
GUICtrlSetFont(-1, 14, 800, 0, "Verdana")
$btnOverit = GUICtrlCreateButton("Overiť", 248, 103, 51, 30, $WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$btnVypocitat = GUICtrlCreateButton("Vypočítať", 304, 103, 59, 30, $WS_GROUP)
$btnNovyPriklad = GUICtrlCreateButton("Nový príklad", 368, 103, 75, 30, $WS_GROUP)
$inputVysledok = GUICtrlCreateInput("", 174, 105, 65, 26, BitOR($ES_CENTER,$ES_NUMBER,$WS_GROUP))
GUICtrlSetState(-1, $GUI_FOCUS)
GUICtrlSetFont(-1, 12, 800, 0, "Verdana")
$labelStatSpravne = GUICtrlCreateLabel("Správne:", 61, 165, 67, 22, $WS_GROUP)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 0x008000)
$labelStatSpravneCislo = GUICtrlCreateLabel("0", 133, 165, 27, 22, $WS_GROUP)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 0x008000)
$labelStatNespravne = GUICtrlCreateLabel("Nesprávne:", 189, 165, 83, 22, $WS_GROUP)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 0xFF0000)
$labelStatNespravneCislo = GUICtrlCreateLabel("0", 275, 165, 27, 22, $WS_GROUP)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 0xFF0000)
$labelStatPocitac = GUICtrlCreateLabel("Počítač:", 333, 165, 59, 22, $WS_GROUP)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 0x000080)
$labelStatPocitacCislo = GUICtrlCreateLabel("0", 396, 165, 27, 22, $WS_GROUP)
GUICtrlSetFont(-1, 10, 400, 0, "Verdana")
GUICtrlSetColor(-1, 0x000080)
GUISetState(@SW_SHOW)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		
		Case $btnOverit
			GUICtrlSetState($btnOverit, $GUI_DISABLE)
			GUICtrlSetState($btnNovyPriklad, $GUI_FOCUS)
			If GUICtrlRead($labelCisloVlavo) * GUICtrlRead($labelCisloVpravo) = GUICtrlRead($inputVysledok) Then
				GUICtrlSetState($btnVypocitat, $GUI_DISABLE)
				GUICtrlSetBkColor($inputVysledok, 0x008000)
				GUICtrlSetData($labelStatSpravneCislo, GUICtrlRead($labelStatSpravneCislo) + 1)
			Else
				GUICtrlSetState($btnVypocitat, $GUI_FOCUS)
				GUICtrlSetBkColor($inputVysledok, 0xff0000)
				GUICtrlSetData($labelStatNespravneCislo, GUICtrlRead($labelStatNespravneCislo) + 1)
			EndIf
		
		Case $btnVypocitat
			GUICtrlSetState($btnVypocitat, $GUI_DISABLE)
			GUICtrlSetState($btnOverit, $GUI_DISABLE)
			GUICtrlSetState($btnNovyPriklad, $GUI_FOCUS)
			GUICtrlSetBkColor($inputVysledok, 0x000080)
			GUICtrlSetColor($inputVysledok, 0xffffff)
			GUICtrlSetData($inputVysledok, GUICtrlRead($labelCisloVlavo) * GUICtrlRead($labelCisloVpravo))
			GUICtrlSetData($labelStatPocitacCislo, GUICtrlRead($labelStatPocitacCislo) + 1)
		
		Case $btnNovyPriklad
			GUICtrlSetState($btnOverit, $GUI_ENABLE)
			GUICtrlSetState($btnVypocitat, $GUI_ENABLE)
			GUICtrlSetData($labelCisloVlavo, Random(0, 10, 1))
			GUICtrlSetData($labelCisloVpravo, Random(0, 10, 1))
			GUICtrlSetBkColor($inputVysledok, 0xffffff)
			GUICtrlSetColor($inputVysledok, 0x000000)
			GUICtrlSetData($inputVysledok, "")
			GUICtrlSetState($inputVysledok, $GUI_FOCUS)
		

	EndSwitch
WEnd
