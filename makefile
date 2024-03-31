PACKAGES=$(wildcard packages/*)
FEATURES=$(wildcard packages/features/*)


print:
	@echo $(PACKAGES)
	@echo $(FEATURES)

get:
	flutter pub get
	for package in $(PACKAGES); do \
		cd $$package; \
		echo "Getting package for $$package"; \
		flutter pub get; \
		cd ../../; \
	done
	for feature in $(FEATURES); do \
		cd $$feature; \
		echo "Getting package for $$feature"; \
		flutter pub get; \
		cd ../../../; \
	done
clean:
	flutter clean
	for package in $(PACKAGES); do \
		cd $$package; \
		echo "Cleaning package for $$package"; \
		flutter clean; \
		cd ../../; \
	done
	for feature in $(FEATURES); do \
		cd $$feature; \
		echo "Cleaning package for $$feature"; \
		flutter clean; \
		cd ../../../; \
	done
upgrade:
	flutter pub upgrade
	for package in $(PACKAGES); do \
		cd $$package; \
		echo "Upgrading package for $$package"; \
		flutter pub upgrade; \
		cd ../../; \
	done
	for feature in $(FEATURES); do \
		cd $$feature; \
		echo "Upgrading package for $$feature"; \
		flutter pub upgrade; \
		cd ../../../; \
	done
generate:
	flutter pub run build_runner build --delete-conflicting-outputs
	for package in $(PACKAGES); do \
		cd $$package; \
		echo "Generating package for $$package"; \
		flutter pub run build_runner build --delete-conflicting-outputs; \
		cd ../../; \
	done
	for feature in $(FEATURES); do \
		cd $$feature; \
		echo "Generating package for $$feature"; \
		flutter pub run build_runner build --delete-conflicting-outputs; \
		cd ../../../; \
	done