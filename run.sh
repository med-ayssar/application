rm -rf target
make 

pdftk ./target/cv_english.pdf cat 1-3  output ./submit/cv_en.pdf 
pdftk ./target/cv_english.pdf cat 4-5  output ./submit/anschreiben_en.pdf
pdftk ./target/cv_german.pdf cat 1-3  output ./submit/cv_de.pdf 
pdftk ./target/cv_german.pdf cat 4  output ./submit/anschreiben_de.pdf

#xdg-open cv_en.pdf
#xdg-open cv_de.pdf

#xdg-open anschreiben_de.pdf
xdg-open ./submit/anschreiben_en.pdf


echo "------------done"