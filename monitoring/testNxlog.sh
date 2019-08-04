find ./nxlog/files/input ! -name 'input.log' -type f -exec rm -f {} +
cat /dev/null > ./nxlog/files/output/out.csv
cp -a ./nxlog/files-testing/. ./nxlog/files/input