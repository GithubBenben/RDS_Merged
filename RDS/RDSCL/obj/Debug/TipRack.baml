   M S B A M L   `   `   `  ����@  <RDSCL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:RDSCLRDSCL  5          RDSCL.TipRack   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      %localclr-namespace:RDSCL     5        � 	Resources  5	         TwinkleAnimation �� TargetProperty W� From	 W� To g� Duration  BackgroundFill �� EndPoint �� 
StartPoint � Color � Offset  _1000uLStyle	 �� 
TargetType
 �� Property �� Value  
_noneStyle  _300uLStyle��%�  &	        &	 j     &	 [    &	 �    &	     �� 5
   
   .��5      W� $ Opacity�6   $	 0.0X�6B   $	 1.0X�6M   $ 0:0:1D�6V   5      �� 5   
   $ 0.5,1&�65   $	 0,0&�6F   .��5      � $ 	#FF4B4B4B��6   $ 1Q�6-   � 5      $ White��6   � 5      $ 	#FF939393��6   $ 0.364Q�6-   � 5      $ 	#FFB8B4B4��6   $ 0.703Q�6-   5      �� 5   
   "	 A�6%   .�5      �� 
 � ��$ 18��6&   �� 5      
 � ��$ 18��6'   �� 5      
 � ��$ 4,2,0,0q�6'   5      �� 5   
   "	 A�6#   �� 5   
   "	 A�6$   .�5      �� 
 � ��$ 16��6&   �� 5      
 � ��$ 16��6'   �� 5      
 � ��$ 7,5,0,0q�6'   5       5!      ��5"      �� 5#   
   "	 >�6   .�5$      �� 
 � �� 5%      �� 5&       �� 
TargetType" >�6&   .R�5'      (�  (� Stretch$
 Fill=�6"   .��5(      �� $	��290��6%   $	��200��61   .+�5)   "   ��  ��Name$ Rectangle_Frame��6,     	BlueColor#��[ 6E   $��1��6i    �� StrokeDashArray$ 5R�6}    �� RadiusX$ 10��6�    �� RadiusY$ 10��6�   $	��290��6�   $	��200��6�     WathetColor3#��[ 6�   �� 5*   "    ��Name$ StackPanel_Body��6-    �� Orientation$ Vertical=�6F   .+�5+   &   �� $ StackPanel_0��61   $ 
Horizontal=�6G   $��	12,12,0,0q�6`   .+�5,   *   A�  A�Name$ 	Ellipse_0��62   ��6E   �� *$"DataSource.Tips[0].TipContentColor+ �� RelativeSource �� *FindAncestor+ �� AncestorType   RDSCL.TipRack"  A� 5-   *   $ 	Ellipse_1��62   ��6F   �� *$"DataSource.Tips[1].TipContentColor+ �� *FindAncestor+"  A� 5.   *   $ 	Ellipse_2��62   ��6F   �� *$"DataSource.Tips[2].TipContentColor+ �� *FindAncestor+"  A� 5/   *   $ 	Ellipse_3��62   ��6F   �� *$"DataSource.Tips[3].TipContentColor+ �� *FindAncestor+"  A� 50   *   $ 	Ellipse_4��62   ��6G   �� *$"DataSource.Tips[4].TipContentColor+ �� *FindAncestor+"  A� 51   *   $ 	Ellipse_5��62   ��6G   �� *$"DataSource.Tips[5].TipContentColor+ �� *FindAncestor+"  A� 52   *   $ 	Ellipse_6��62   ��6H   �� *$"DataSource.Tips[6].TipContentColor+ �� *FindAncestor+"  A� 53   *   $ 	Ellipse_7��62   ��6H   �� *$"DataSource.Tips[7].TipContentColor+ �� *FindAncestor+"  A� 54   *   $ 	Ellipse_8��62   ��6H   �� *$"DataSource.Tips[8].TipContentColor+ �� *FindAncestor+"  A� 55   *   $ 	Ellipse_9��62   ��6H   �� *$"DataSource.Tips[9].TipContentColor+ �� *FindAncestor+"  A� 56   *   $ 
Ellipse_10��62   ��6I   �� *%#DataSource.Tips[10].TipContentColor+ �� *FindAncestor+"  A� 57   *   $ 
Ellipse_11��62   ��6I   �� *%#DataSource.Tips[11].TipContentColor+ �� *FindAncestor+"  58   '   �� 5:   &   $ StackPanel_1��61   $ 
Horizontal=�6G   $��12,2,0,0q�6`   .+�5;   *   A� $ 
Ellipse_12��62   ��6I   �� *%#DataSource.Tips[12].TipContentColor+ �� *FindAncestor+"  A� 5<   *   $ 
Ellipse_13��62   ��6I   �� *%#DataSource.Tips[13].TipContentColor+ �� *FindAncestor+"  A� 5=   )   $ 
Ellipse_14��61   ��6H   �� *%#DataSource.Tips[14].TipContentColor+ �� *FindAncestor+"  A� 5>   )   $ 
Ellipse_15��61   ��6H   �� *%#DataSource.Tips[15].TipContentColor+ �� *FindAncestor+"  A� 5?   )   $ 
Ellipse_16��61   ��6H   �� *%#DataSource.Tips[16].TipContentColor+ �� *FindAncestor+"  A� 5@   )   $ 
Ellipse_17��61   ��6H   �� *%#DataSource.Tips[17].TipContentColor+ �� *FindAncestor+"  A� 5A   )   $ 
Ellipse_18��61   ��6G   �� *%#DataSource.Tips[18].TipContentColor+ �� *FindAncestor+"  A� 5B   )   $ 
Ellipse_19��61   ��6H   �� *%#DataSource.Tips[19].TipContentColor+ �� *FindAncestor+"  A� 5C   )   $ 
Ellipse_20��61   ��6H   �� *%#DataSource.Tips[20].TipContentColor+ �� *FindAncestor+"  A� 5D   )   $ 
Ellipse_21��61   ��6H   �� *%#DataSource.Tips[21].TipContentColor+ �� *FindAncestor+"  A� 5E   )   $ 
Ellipse_22��61   ��6H   �� *%#DataSource.Tips[22].TipContentColor+ �� *FindAncestor+"  A� 5F   )   $ 
Ellipse_23��61   ��6H   �� *%#DataSource.Tips[23].TipContentColor+ �� *FindAncestor+"  5G   '   �� 5I   &   $ StackPanel_2��61   $ 
Horizontal=�6G   $��12,2,0,0q�6`   .+�5J   )   A� $ 
Ellipse_24��61   ��6H   �� *%#DataSource.Tips[24].TipContentColor+ �� *FindAncestor+"  A� 5K   )   $ 
Ellipse_25��61   ��6H   �� *%#DataSource.Tips[25].TipContentColor+ �� *FindAncestor+"  A� 5L   )   $ 
Ellipse_26��61   ��6H   �� *%#DataSource.Tips[26].TipContentColor+ �� *FindAncestor+"  A� 5M   )   $ 
Ellipse_27��61   ��6H   �� *%#DataSource.Tips[27].TipContentColor+ �� *FindAncestor+"  A� 5N   )   $ 
Ellipse_28��61   ��6H   �� *%#DataSource.Tips[28].TipContentColor+ �� *FindAncestor+"  A� 5O   )   $ 
Ellipse_29��61   ��6H   �� *%#DataSource.Tips[29].TipContentColor+ �� *FindAncestor+"  A� 5P   )   $ 
Ellipse_30��61   ��6H   �� *%#DataSource.Tips[30].TipContentColor+ �� *FindAncestor+"  A� 5Q   )   $ 
Ellipse_31��61   ��6H   �� *%#DataSource.Tips[31].TipContentColor+ �� *FindAncestor+"  A� 5R   )   $ 
Ellipse_32��61   ��6H   �� *%#DataSource.Tips[32].TipContentColor+ �� *FindAncestor+"  A� 5S   )   $ 
Ellipse_33��61   ��6H   �� *%#DataSource.Tips[33].TipContentColor+ �� *FindAncestor+"  A� 5T   )   $ 
Ellipse_34��61   ��6H   �� *%#DataSource.Tips[34].TipContentColor+ �� *FindAncestor+"  A� 5U   )   $ 
Ellipse_35��61   ��6H   �� *%#DataSource.Tips[35].TipContentColor+ �� *FindAncestor+"  5V   '   �� 5X   &   $ StackPanel_3��61   $ 
Horizontal=�6H   $��12,2,0,0q�6a   .+�5Y   )   A� $ 
Ellipse_36��61   ��6H   �� *%#DataSource.Tips[36].TipContentColor+ �� *FindAncestor+"  A� 5Z   )   $ 
Ellipse_37��61   ��6H   �� *%#DataSource.Tips[37].TipContentColor+ �� *FindAncestor+"  A� 5[   )   $ 
Ellipse_38��61   ��6H   �� *%#DataSource.Tips[38].TipContentColor+ �� *FindAncestor+"  A� 5\   )   $ 
Ellipse_39��61   ��6H   �� *%#DataSource.Tips[39].TipContentColor+ �� *FindAncestor+"  A� 5]   )   $ 
Ellipse_40��61   ��6H   �� *%#DataSource.Tips[40].TipContentColor+ �� *FindAncestor+"  A� 5^   )   $ 
Ellipse_41��61   ��6H   �� *%#DataSource.Tips[41].TipContentColor+ �� *FindAncestor+"  A� 5_   )   $ 
Ellipse_42��61   ��6H   �� *%#DataSource.Tips[42].TipContentColor+ �� *FindAncestor+"  A� 5`   )   $ 
Ellipse_43��61   ��6H   �� *%#DataSource.Tips[43].TipContentColor+ �� *FindAncestor+"  A� 5a   )   $ 
Ellipse_44��61   ��6H   �� *%#DataSource.Tips[44].TipContentColor+ �� *FindAncestor+"  A� 5b   )   $ 
Ellipse_45��61   ��6H   �� *%#DataSource.Tips[45].TipContentColor+ �� *FindAncestor+"  A� 5c   )   $ 
Ellipse_46��61   ��6H   �� *%#DataSource.Tips[46].TipContentColor+ �� *FindAncestor+"  A� 5d   )   $ 
Ellipse_47��61   ��6H   �� *%#DataSource.Tips[47].TipContentColor+ �� *FindAncestor+"  5e   '   �� 5g   &   $ StackPanel_4��61   $ 
Horizontal=�6G   $��12,2,0,0q�6`   .+�5h   )   A� $ 
Ellipse_48��61   ��6H   �� *%#DataSource.Tips[48].TipContentColor+ �� *FindAncestor+"  A� 5i   )   $ 
Ellipse_49��61   ��6H   �� *%#DataSource.Tips[49].TipContentColor+ �� *FindAncestor+"  A� 5j   )   $ 
Ellipse_50��61   ��6H   �� *%#DataSource.Tips[50].TipContentColor+ �� *FindAncestor+"  A� 5k   )   $ 
Ellipse_51��61   ��6H   �� *%#DataSource.Tips[51].TipContentColor+ �� *FindAncestor+"  A� 5l   )   $ 
Ellipse_52��61   ��6H   �� *%#DataSource.Tips[52].TipContentColor+ �� *FindAncestor+"  A� 5m   )   $ 
Ellipse_53��61   ��6H   �� *%#DataSource.Tips[53].TipContentColor+ �� *FindAncestor+"  A� 5n   )   $ 
Ellipse_54��61   ��6H   �� *%#DataSource.Tips[54].TipContentColor+ �� *FindAncestor+"  A� 5o   )   $ 
Ellipse_55��61   ��6H   �� *%#DataSource.Tips[55].TipContentColor+ �� *FindAncestor+"  A� 5p   )   $ 
Ellipse_56��61   ��6H   �� *%#DataSource.Tips[56].TipContentColor+ �� *FindAncestor+"  A� 5q   )   $ 
Ellipse_57��61   ��6H   �� *%#DataSource.Tips[57].TipContentColor+ �� *FindAncestor+"  A� 5r   )   $ 
Ellipse_58��61   ��6H   �� *%#DataSource.Tips[58].TipContentColor+ �� *FindAncestor+"  A� 5s   )   $ 
Ellipse_59��61   ��6H   �� *%#DataSource.Tips[59].TipContentColor+ �� *FindAncestor+"  5t   '   �� 5v   &   $ StackPanel_5��61   $ 
Horizontal=�6G   $��12,2,0,0q�6`   .+�5w   )   A� $ 
Ellipse_60��61   ��6H   �� *%#DataSource.Tips[60].TipContentColor+ �� *FindAncestor+"  A� 5x   )   $ 
Ellipse_61��61   ��6H   �� *%#DataSource.Tips[61].TipContentColor+ �� *FindAncestor+"  A� 5y   )   $ 
Ellipse_62��61   ��6H   �� *%#DataSource.Tips[62].TipContentColor+ �� *FindAncestor+"  A� 5z   )   $ 
Ellipse_63��61   ��6H   �� *%#DataSource.Tips[63].TipContentColor+ �� *FindAncestor+"  A� 5{   )   $ 
Ellipse_64��61   ��6H   �� *%#DataSource.Tips[64].TipContentColor+ �� *FindAncestor+"  A� 5|   )   $ 
Ellipse_65��61   ��6H   �� *%#DataSource.Tips[65].TipContentColor+ �� *FindAncestor+"  A� 5}   )   $ 
Ellipse_66��61   ��6H   �� *%#DataSource.Tips[66].TipContentColor+ �� *FindAncestor+"  A� 5~   )   $ 
Ellipse_67��61   ��6H   �� *%#DataSource.Tips[67].TipContentColor+ �� *FindAncestor+"  A� 5   )   $ 
Ellipse_68��61   ��6H   �� *%#DataSource.Tips[68].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_69��61   ��6H   �� *%#DataSource.Tips[69].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_70��61   ��6H   �� *%#DataSource.Tips[70].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_71��61   ��6H   �� *%#DataSource.Tips[71].TipContentColor+ �� *FindAncestor+"  5�   '   �� 5�   &   $ StackPanel_6��61   $ 
Horizontal=�6G   $��12,2,0,0q�6`   .+�5�   )   A� $ 
Ellipse_72��61   ��6H   �� *%#DataSource.Tips[72].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_73��61   ��6H   �� *%#DataSource.Tips[73].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_74��61   ��6H   �� *%#DataSource.Tips[74].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_75��61   ��6H   �� *%#DataSource.Tips[75].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_76��61   ��6H   �� *%#DataSource.Tips[76].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_77��61   ��6H   �� *%#DataSource.Tips[77].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_78��61   ��6H   �� *%#DataSource.Tips[78].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_79��61   ��6H   �� *%#DataSource.Tips[79].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_80��61   ��6H   �� *%#DataSource.Tips[80].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_81��61   ��6H   �� *%#DataSource.Tips[81].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_82��61   ��6H   �� *%#DataSource.Tips[82].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_83��61   ��6H   �� *%#DataSource.Tips[83].TipContentColor+ �� *FindAncestor+"  5�   '   �� 5�   &   $ StackPanel_7��61   $ 
Horizontal=�6G   $��12,2,0,0q�6`   .+�5�   )   A� $ 
Ellipse_84��61   ��6H   �� *%#DataSource.Tips[84].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_85��61   ��6H   �� *%#DataSource.Tips[85].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_86��61   ��6H   �� *%#DataSource.Tips[86].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_87��61   ��6H   �� *%#DataSource.Tips[87].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_88��61   ��6H   �� *%#DataSource.Tips[88].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_89��61   ��6H   �� *%#DataSource.Tips[89].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_90��61   ��6H   �� *%#DataSource.Tips[90].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_91��61   ��6H   �� *%#DataSource.Tips[91].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_92��61   ��6H   �� *%#DataSource.Tips[92].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_93��61   ��6H   �� *%#DataSource.Tips[93].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_94��61   ��6H   �� *%#DataSource.Tips[94].TipContentColor+ �� *FindAncestor+"  A� 5�   )   $ 
Ellipse_95��61   ��6H   �� *%#DataSource.Tips[95].TipContentColor+ �� *FindAncestor+"  5�   '   5�   #   5�      5�       �� Triggers 5�      P� 5�       P� Property �@J�IsMouseOver P� Value . 5�      5�      5�      5�      5�      