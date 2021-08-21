#chmod u+x ./build_runner.command

cd domain

flutter pub run build_runner build --delete-conflicting-outputs

cd - 

cd data

flutter pub run build_runner build --delete-conflicting-outputs

cd -

flutter pub run build_runner build --delete-conflicting-outputs
