dart generate.dart generate
cd ..
pub run build_runner build
dartfmt -w . &> dartfmt.txt
