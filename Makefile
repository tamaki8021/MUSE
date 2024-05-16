FVM := fvm flutter

# setup
.PHONY: setup
setup:
	dart pub global activate fvm
	fvm install
	$(FVM) pub get

.PHONY: doctor
doctor:
	$(FVM) doctor

# code format
.PHONY: format
format:
	fvm dart format lib/

# code analyze
.PHONY: analyze
analyze:
	$(FVM) analyze

# packages install
.PHONY: get
get:
	$(FVM) pub get

# packages upgrade
.PHONY: upgrade
upgrade:
	$(FVM) packages upgrade

# packages clean
.PHONY: clean
clean:
	$(FVM) clean

# 開発環境（dev）の起動
.PHONY: run
run:
	$(FVM) run --dart-define=FLAVOR=dev --target lib/main.dart

# 本番環境（prod）の起動
.PHONY: run-prod
run-prod:
	$(FVM) run --dart-define=FLAVOR=prod --target lib/main.dart

# code generate
.PHONY: build_runner
build_runner:
	$(FVM) pub run build_runner build --delete-conflicting-outputs

.PHONY: test
test:
	$(FVM) test

# 開発環境（dev）のビルド
.PHONY: build-ios-dev
build-ios-dev:
	$(FVM) build ios --flavor dev --dart-define=FLAVOR=dev --target lib/main.dart

# 本番環境（prod）のビルド
.PHONY: build-ios-prod
build-ios-prod:
	$(FVM) build ios --release --flavor prod --dart-define=FLAVOR=prod --target lib/main.dart