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
BZh91AY&SY�vr� ���~�����������@D@  `��<��꺄��m���I=   Ph 4      �"f�T�Q�=@!�h�h� �  !#Sjh���@ �   �1�h ����j��zjz��Sړ	��iQ�==H�=F�	�� 6� �h i�@�L�0@b  H�4�"`Di�=M4�G��4=G�=@ @ ��Yim�dX5;_�H�ȸ�U'EJt�L�������N{�ohy#�:cbV�;�1X��9R��e�
]2����r�zq{����IZ�d�`P˔�jǺ��Ъ�D�_���L��[�i"f,a������M*6�n��ʹ�q��J���B4l�K,�����j�Q��k
��Pmf}[_�i�����5�3��V�z������7��}�,7[�������'H�:���g�W�񺵙-[-�����Si�����B�8����Jv�D�E?ey���H0�!r��O]�tUġ���l�Mr滙Mq�sJ��pB7[2"~Kl9$���g�Y�P	���f��6��!����n#j'받-���Zm��.ؑ����v������?����_����1I�����O[֒Ld���*S����J;�Pង�l��CHQ1�f!.�u �����:?8�Zi%��?$:��9O���{�q�&�q��'�X�=gn�&a`Yg$�	x�n@Ş��ѹ,����~z���e�����E�@�MJвo$��+[�� ��� �9]8R��{�B�U
����� }q�$�5�2�� ����m��n�)e^80"�=Q�t٬b��J8��kC4*A����}��8$�z7���}5���7i����O{XD:(n4LB�39%��]��XW�z\�5��Þ��;B0���h�GC`^�S�L�$٫e����u2F"�Ud�kM��g6m��?�)Qq#��)
%߰�`M�[�i�њF�VP�c���M@�ņ��}���	<�d-hN]P�(ZY��t��#C�ߗ�T�]�h:��,;-���t
x?"7x
I��~:�x�����D\�����B���ȋ:FW��]jY.x�[��4����RZe2�)."#%m�:����~�A���iu�YE�!܇�z�4_V�J�,��ޕ (a,�jh�:��L��vD@|H��>_-�4�SeH>�	����J��xL=N>�ƌ��+�^�6����e�bTO�L��Lmt�3��W�w�գR�څ�j""�. �)ntŮ�%��h\��V�ΰ�#�d�ؐ��	/)Klp�`��!)����);M��.�Jm́	b���+iXp^�����6@�&��Έ�c��v��Y�7¹
�u���(�(��6i�4J�3 �3�jD�%7<5�EG*Ι�F4��z�YS1�5�/0EH;�N�@l�Ĺ$`� �t��]�-K��e�>�`�8��I����/J��ώ;Ù��OxY���E�.i�P���Z�ե�(����A#rQ�z/Z�f��&`4C�-���V|��.��uZa���ן��5aJf\�h��\���s��V�C_�,|�����%�slU0��BJiP��C��ʅ�d(*(P6�(]j�PJDնSxPZ�����m��#�N�>�T�#/u(^a�֝5̫�P�&�P:�Dq��%�0c�	T�Y�D!FOz�wϽ�������		�!3ه$�R�G�rE8P��vr�