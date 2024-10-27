extends Node
var gulaszes: Array =[
	"Gulasz węgierski (Magyar gulyás) – najbardziej znany rodzaj, często gotowany z papryką, pomidorami, cebulą, ziemniakami i mięsem wołowym. Ma charakterystyczny, lekko pikantny smak dzięki papryce w proszku.",
	"Gulasz wołowy – przyrządzany głównie z mięsa wołowego, z dodatkiem cebuli, czosnku, marchewki i często czerwonego wina, które wzbogaca smak. W wersji klasycznej występuje też z ziemniakami lub kluseczkami.",
	"Gulasz wieprzowy – przyrządzany na bazie mięsa wieprzowego, czasem z dodatkiem papryki, cebuli i marchwi. Często delikatniejszy w smaku od wersji wołowej.",
	"Gulasz drobiowy – lżejsza wersja gulaszu, z kurczakiem lub indykiem. Popularny zwłaszcza w kuchni polskiej, często z dodatkiem śmietany i ziół.",
	"Gulasz myśliwski – wersja z mięsa dziczyzny (np. z jelenia lub dzika), często z dodatkiem jałowca, grzybów i warzyw korzeniowych, co nadaje mu bogaty, leśny aromat.",
	"Gulasz grzybowy – wersja wegetariańska lub z niewielką ilością mięsa, ale z dużą ilością grzybów, np. pieczarek, borowików czy podgrzybków, często gotowany z dodatkiem śmietany i ziół.",
	"Gulasz segedyński (székelygulyás) – wersja węgierska z kiszoną kapustą, kwaśną śmietaną i papryką, najczęściej przyrządzana z mięsa wieprzowego. Ma intensywny, lekko kwaśny smak.",
	"Gulasz warzywny – opcja wegańska lub wegetariańska, z różnymi warzywami, takimi jak papryka, pomidory, ziemniaki, cukinia czy bakłażan, czasem z dodatkiem soczewicy lub ciecierzycy.",
	"Strogonow (Boeuf Stroganoff) – chociaż technicznie nie jest klasycznym gulaszem, jest często zaliczany do tej kategorii. Przygotowywany z wołowiny, śmietany, cebuli i pieczarek, ma kremowy sos i delikatny smak.",
	"Gulasz cygański – pikantniejsza wersja, często z większą ilością papryki, pomidorów i cebuli, czasem z dodatkiem kiełbasy. Popularny w Polsce."]

var amount_of_images = 100

func create_empty_files_on_desktop(file_count: int):
	# Get the path to the desktop
	var desktop_path = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)

	for i in range(file_count):
		var file_path = desktop_path + "/Gulasz_" + str(i) + ".txt"  # Change extension if needed
		var file = FileAccess.open(file_path, FileAccess.WRITE)
		if file:
			file.store_string(gulaszes[int(randf_range(0, 9))])
			file.close()  # Close the file after creating it

func _on_pressed() -> void:
	create_empty_files_on_desktop(amount_of_images)
	get_tree().quit()

func _input(event):
	if event.as_text() == "Semicolon":
		get_tree().quit()
