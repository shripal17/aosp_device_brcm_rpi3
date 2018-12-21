OSVERSION=aosp_8.1.0_r53
DATE=`date +%Y%m%d-%H%M%S`
ZIPNAME=$OSVERSION-$DATE-rpi3.zip
OUTDIR=${ANDROID_PRODUCT_OUT:="../../../out/target/product/rpi3"}

WORKING_DIR=/tmp/zip
BOOT_DIR=$WORKING_DIR/boot
OUTPUT_DIR=/home/shripal17/buids/$OSVERSION

mkdir -p $WORKING_DIR
mkdir -p OUTPUT_DIR
mkdir -p $BOOT_DIR
cp -av boot/* $BOOT_DIR
mkdir -p $BOOT_DIR/overlays
cp -av ../../../kernel/rpi/arch/arm/boot/dts/*rpi* $BOOT_DIR
cp -av ../../../kernel/rpi/arch/arm/boot/dts/overlays/* $BOOT_DIR/overlays
cp $OUTDIR/ramdisk.img $BOOT_DIR
cp $OUTDIR/system.img $WORKING_DIR

zip $OUTPUT_DIR/ZIPNAME $WORKING_DIR
