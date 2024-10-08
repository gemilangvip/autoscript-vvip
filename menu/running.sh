#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY��A� R��r�� ���������� �D 0� P `\2��ooa����op�/gUC@T�RQ(54S4OM��Ѡ�4 �  h44�  d�&!Ѣ����@h 4h@ ��p  @d   ��    jHL��z��Ȇ��ѣM���h4@��M ��T�ЦzS#G� �@d�  ��M4H@F��L�Ѥ�LmC
4bm#@ @� �� ��k���V��)s�߉���>ª�������U]s�Χo����,K�k����f�m8pĳ�}�b�
�z�:�+�$��P��zx�l�0Қ���HRSV���GS*�W�m�r���W	��w/(-k�:�@ =�L�u�f�F�KP�E7��4W2f~�G&tW����P��9tqwM�&�㍱%0p �`@A��Wv֔NC ,��� �%�Ϝ�rPB�jto=GJ�� �B��nQ�%�h¦��b�H4Z�<g�V������6�|��T`
V����$cM��m1��B��ˌ���1�aI4�G+�w����BJ� � e�^�Z�Y�x T�L}P$�jLZ$�V�s���&,-���٬�nʂ��Iy�9@2<Ȼ���_�R�����S��6�Nʿ�<S'T2aC��x���Aj��� ͏7�NZY$9|������r���ڣ���6Ag86�*DRF��L�'l&`�%��R*�P̠l��B<FpA�'Vy��\!��wx�c�(*1���A�k�'� �'_�$DxТ0@������������&B	lk� �!H7�JU��9ud�H���K� �d�T8D�	��"�UO� ���fNmc�%T$*��2��J8��@'������|6��Ĕ����e�z��VeQ���yi�>C��������J߁�Cc2C������䠜/Y-QG�F�|0-���F[T%}#j*��8��x�c�|� 
�3���*p�6�R��ߓ�[��pT���(��A��>OyGgN��^uD���B�q ��\\s�n���9�	u5m41�$���+N��A�~�{sJ䁜JfBT��J���M)�ZX>����g�1��ˮ �9���)БBAOX����{t�c?���c�:�դ!�����gI�Ҿ@��Y9(@5�жU*���'�M��`�85����_�`� ���P�-�a�e! �n� �"]6@:+5�%fU�^���;ڌx�������?E7�5}�Ub�^X&A�Ŋ�])���* d{�d�����MF�R�(?g�1��	 j���q��e~�gĀ|Q�2I'fVF�� Iǐ�#
9�����Mqm�����3�����
��L�n��N�AMW`���
I�=ek�٫����Z �`�򁴐�%�)Q�qo[  ( -�%�͈2@�@��@�ÊIj�f�)!tQu�\�h�}-��L�~R-~  ��<��f|�����%k����n�A}QUJ�ιt� ��9In�B	K�,�����h���m�$
�ϥ�LJD���㤥v ]���!�R}T+�n��p ��PIQ����j1 �nў]��/�X�ϐx�IJ���Q�?�N��I2>s9�AA! =�@;
]��u �F�����:4�)媱>��,�S
"y�o5����&���/A����K�j�Ɔs��#9DC�iˡY�0�;_)!�Yf�5�WC�F`���<�k�1�]#�d9@�2�t�!�����(Tv>��;:�>��0�3��Q�@�A����Ep����g�q�	���`��.L��k.3�Г����1��Z!�߼i"�`Q�֣9�-���
ZP�*���T�ܡ]��c��e�0h ��t��L��ht<Ѓ��=`�ä�b�j��u�/n��@F-,_j� ����1�����qx}�_"�.�l��T�w�w��ee��@.<���n�"%9��P�R��sf�f2/=�[U�2�:t%���+�ƆЫ��_ ���׀��x�+�J��:���Q���ˌJ�nT0vs
�"�c�$;�ץe�ƃ"	��}
�\�)��'�n����LƒP}]�/������+����eSB�T�t{&�F�ɜejt�x�Eg'&�)jY]����iBeqcn�Ij����mk�qWZ�ֵ��Qf�U���@`�؇�2H]��y$,q`v�hm�&~a�,ࠗS��k� 4z��0���Ї@#/[J��H=Vݴ�	�fk�Q2m�D�y6�F�+� ���|Z"aK�Zk��@=cr�vtD����e� Є�[g�p��5O��X�9��B��l��6��G���e=��''��f��s�� ��ZU�X-�S���^|<�Bm�4��a��H��̸m�m2e���#��~P��N�N�� �s��L�Y|:�&�$�\��0�6���$�M-�;h-�r�j����h�ab1IbF$g��VP�ܞ�����2!
cB�s�,��1.�/�3�5טH]�hj��n�&8�^Y�!V�La|����(�5B�x�k
Z�QE��	���Z�Qu�s��
s :u�Ӝh��ј*�E`e���m�B��$B"\%�]t��+]#�i諚�Ҫ�;-B�ݵ}�%l�1�]���ʭ��� O}��QMx��0����D���&�px�Q�XM��q�p%�D�]\�cP�	Xa.���G	����! ���ˤ�L��ѾѰ�s_ba-rO%�28^�\��(�L�����3�����C�\.�ݟG��}�l�g� � Q5�X�M`� �����FI���z�A6)#�.�p�!sb�b