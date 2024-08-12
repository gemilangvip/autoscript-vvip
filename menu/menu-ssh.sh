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
BZh91AY&SY�k/ _�~�����������`D@  � P `����w�N�^�a��=�R���	��SҞOj�=MF�z�h�C��6��@zF4� �T�Q�h��M�SOQ�     � SS�"M&�@�4   ��    	SК��0�#z�A�4h 4�F��1@d ���d  	"@M�x�i�h�Q�̃Pb � = D�kM"��cT�~�^��������E��`�[��q���.N,Q	�9��DаF�q9�k>�%cR,���򯒛頵V�6�]j�ª.OV�>�T��J�
��!B~,�M��XSQM�N��r�/xm	���'2�,�-'&��{K%-a�6��u����h+-@�}D��a�%�e��.8Q���T���i�a��¶(�%/J�����4y����TP.�h"	dS,��!H��u�J��Z<��Z�q��Β�B����t3Dɿ(��@��
@/R� �
�t0}�/���"�z��:'T52@WE��ҷCg4��SUՀ��.J;��i�Fi���q�C: �(m2S����hX�Scc�k�B%b� EPI�Yj��/읶�,1cjs,M�t�X�+	�	�P
D
r7q�c��uo>V�H�T�tAz���"��(��)���$�b�w�`��9)E5#_�"��g�C�}G����l����F]s�S~i�o*�B��J}Z��%"�5�ވ�́�b!����RGE&�MTё;��LI����H����J<���ޏ��ͣ�&:/����!p&�L˩o�GX������Е99&Q*�����,L1 @A��B��x�|/x{�փh�@�f
�:�.˚������ڈ����-AQ��q�,���m��nbW��nw���m>���%T�v��U��#��5�H����ׂ�x��\� tH� Lq�(>$�"G'H9Sn*h�B�]7@�L�y���l��4K�o%v� P�c*"!�ߠ��^iK!C�$�g�r�l�0N(�iR��E5�`�Y���#R#��)/"q�@��:��#�Yx�(Lr#$M �"Cs�}�Na6Y�Af�~��C�&�e������_xLIhd�aH�4�4.e�SIv�`�!��"s2<�1Pm%��C���"��0��~r�B~���:�8�*� ��څF`u�c�b���X��D�k�<9Vސ��1=>V�
e�CB�P�8��X���
[�}2���`��eIʍJ�&�)"T�q)�9  8]�R�A�g8�<)h��u�8!6�������t�v�L[��	�t�dں��O}B�Y�a��q�4f��d�Z.�u0����K!��1��>b���1�xW������[M$a���j'\ŗ'�q)�:�J�J�i���׍�7�"��7R]4ERt�0���mf��)� ��%"w�������x<l����+.�}�� ��|�f3�cC8��%<�_�ۉH�	Z/Y�e
�S���4�"��s�� ��ڹ�R�! @IJ����WWMZ�r�3�;Nf��*�~
7Ⱦ`�R�r-��f(h�$H`��hd�^y�,�WQV�+�#ġ0rcX�!U@WDնixy��M�
N�Q,��"�-_f��uAZ�
�ߘ��5t����ؐ:��(@��/E�Y',�"���u�Lws)�`ecZ�#*�"�Ύ��np��4�#�/
�9��{P뤎��p5k`h�F��h�L8JEq�x_�Y_b���S,4*R���]2(��r�Y(
�:b�ºS)	@L��u���-�Y&Z��>�X��~�Cq-���&SO����FzF�[�wU
D�*
�\�<�-
\�c`< �f��� - ���A_K��䅩JG�-���8�����ݘ��M !o���m�.�p�!��^