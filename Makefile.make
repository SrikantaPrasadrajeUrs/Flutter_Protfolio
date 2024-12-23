.PHONY: all

build web:
	@echo "Hi Srikanta! Cleaning flutter project 🫡"
	flutter clean
	@echo "Lets get all dependencies fast fast! 🏃🏼‍➡️"
	flutter pub get
	@echo "Done 😎"
	flutter build web --release