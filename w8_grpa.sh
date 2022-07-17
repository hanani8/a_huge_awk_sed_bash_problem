#!/bin/bash
sed -e '/^\[/d' ocr_names.txt > names.txt
sed -e '/^\[/d' ocr_shopname.txt > shops.txt

mkdir new

sed -e 's/^| //' -e 's/^1 //' -e 's/aI //' -e 's/I //' -e 's/elite/Julia/' -e 's/Royal/Rajesh/' names.txt > names1.txt

readarray -t names < names1.txt
readarray -t shops < shops.txt
for i in ${!names[@]}; do
        y=`expr 1 + $i`
        echo "${shops[$i]}:${names[$i]}:$y" > new/shopping_bill_"$y".txt
        echo "Item:Category:Qty:Price:Cost" >> new/shopping_bill_"$y".txt
done

cat ocr_item_record.txt | uniq | sed -E 's/.*:.*/_/g' | sed -E '/\)|^$|^Item|\beS\b|\|/d' | tr -d "=" > item_records.txt
cat item_records.txt |
sed '1d' |
sed 's/\.\.\./_/g' |
awk 'BEGIN {RS="_"; FS="\n"};{for (i = 1;i <= NF; i++) if($i !~/^$/){print $i >> "new/shopping_bill_"NR".txt"}}'


echo '#!/bin/awk
BEGIN {RS="\n"}
{
        if(NR!=1&&NR!=2)
                {
                        if(NF==5)
                                {
                                    ans = sprintf("%s:%s:%s:%s:%s", $(NF-4),$(NF-3),$(NF-2),$(NF-1),$(NF-0))
                                    print ans
                                }
                        else
                                {
                                k = sprintf("%s %s:%s:%s:%s:%s", $(NF-5),$(NF-4),$(NF-3),$(NF-2),$(NF-1),$(NF-0));
                                print k
                                }
                }
        else
                {
                        print $0;
                }
}' > x.awk 

for i in {1..30}; do
    awk -f x.awk new/shopping_bill_"$i".txt > shopping_bill_"$i".txt
done

sed -Ei "s/:a/:3/g" shopping_bill_26.txt
