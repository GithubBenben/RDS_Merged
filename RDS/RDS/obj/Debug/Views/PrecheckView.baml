   M S B A M L   `   `   `  ����@  <RDSCL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null,"clr-namespace:RDSCL;assembly=RDSCLRDSCL  5       RDS   RDS.Views.PrecheckView   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      4rdscl"clr-namespace:RDSCL;assembly=RDSCL     5        � 	Resources  5	         	TextBlock  TextBlockStyle �� BasedOn �� 
TargetType �� Property �� Value  Path��%�   &	        7  &	 S     �� 5   
   8   " ��6L   .�5      ��  � ��$ 20,0,0,0q�6'   5      �� 5   
   " F�6   .�5      ��  �@��Stretch$ UniformToFill=�6(   �� 5       � ��$ 50��6&   5      5      .��5      (�  (� Stretch$
 Fill=�6   .��5   
   � $	��950��6   $	��500��6   .+�5      �� .+�5      �� $	��800��6    �� Left$ 80��6)   
 �� Top$ 60��6:    �� Orientation$ Vertical=�6K   .+�5      ]� ��. .+�5      F� #��[ 6     
Instrument#��[ 6y   ��6=   �� 	 �� ElementName$	 CheckBox_First��
 �� Path$
 
Foreground�6y   �� 5      #��[  6$      PrecheckView_CheckInstrument#���  6G   �� 5      -   5         ��Name$ CheckBox_First��5   #   {�.  $��20,0,0,0q�6M   $��Right=�6_     RD_ElipseCheckBoxStyle#���  6v   $��50��6�   � 5      -   5         �Name$" ProgressBar_CheckTemperature��5   &   $	��300��6L   $y�Hidden=�6X   $��20,0,0,0q�6l    � SmallChange$ 1Q�6~    � Maximum$	 100Q�6�   5       ]� 5!      ��. $��0,50,0,0q�66   .+�5"      F� #��[ 6     WasteBasket#��[ 6z   $
��Left=�6�   ��6=   �� $	 CheckBox_Second��$
 
Foreground�6�   �� 5#      #��[  6$     PrecheckView_CheckWasteBox#���  6G   �� 5$      -   5        $ CheckBox_Second��5$   #   $��20,0,0,0q�6<   $��Right=�6N   #���  6e   $��50��6�   6�   �� 5%      5&      ]� 5(      ��. $��0,50,0,0q�66   .+�5)      F� #��[ 6     WasteBucket#��[ 6z   ��6=   �� $	 CheckBox_Fourth��$
 
Foreground�6z   �� 5*      #��[  6$    	 PrecheckView_CheckWasteBin#��� 	 6G   �� 5+      -   5        $ CheckBox_Fourth��5+   #   $��20,0,0,0q�6<   $��Right=�6N   #���  6e   $��50��6�   6�   �� 5,      5-      ]� 5/      ��. $��0,50,0,0q�66   .+�50      F� #��[ 6   ����Ѐ���!���!��!���!@o@�@KL @o@�@KL ��!р�[ ��!р�[ @]� �@KL @]� �@KL �ا р�[ �ا р�[ @KL �@KL @KL �@KL ��- ���!��- ���!@KL р�@KL р��ا ���!�ا ���!@]� р�@]� р���!�@T� @]� � �  $�  ��- ��- ���� @]�  ��- ��- ���� �ا  � �lt  � �lt � � �lt @T� �ا @T� @]� 	��6=   �� $	 CheckBox_Fifth��$
 
Foreground�6y   �� 51      #��[  6$    
 PrecheckView_CheckLiquid#��� 
 6G   52      �� 53      -   5        $ CheckBox_Fifth��53   #   $��20,0,0,0q�6;   $��Right=�6M   #���  6d   $��50��6�   6�   �� 54      55      56      �� 57        	LineStyle#��[ 6   	 �� Y1$ 0��6:   	 �� Y2$	 458��6A   $	 780��6J   $ 21��6\   58      59      5:      5;      