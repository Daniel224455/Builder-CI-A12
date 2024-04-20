mkdir ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
source ~/.profile
chmod 755 download_ccache.sh
./download_ccache.sh
mkdir aosp-repo
cd aosp-repo
repo init -u https://android.googlesource.com/platform/manifest -b master
git clone https://gitlab.com/sdm845-mainline/firmware-oneplus-sdm845.git out/target/product/sdm845/vendor/firmware -b aosp
git clone https://github.com/aospm/android_local_manifests .repo/local_manifests -b qrild
repo sync -j$(nproc)
source build/envsetup.sh
# See table above
lunch enchilada-userdebug # Where <codename> is the codename of your device
make -j$(nproc)
