   M S B A M L   `   `   `  ����>  :RDS, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:RDS.Views	RDS.Views  5   	   @ <RDSCL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null,"clr-namespace:RDSCL;assembly=RDSCLRDSCL 5
   	       RDS.Views.PopupWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:RDS.Views     5   	   4rdscl"clr-namespace:RDSCL;assembly=RDSCL     5
   	     � WindowState$  	Maximized=�5   	    � WindowStyle$
 None=�5	   	    � WindowStartupLocation$ CenterScreen=�5   	   $	��600��5   	   $	��900��6    � 
ResizeMode$ NoResize=�6"    � AllowsTransparency . ���	#7FFFFFFF � 	Resources 5         	Path_Exit �� Stretch �� ElementName �� Path  Resources_Path_Add  Add  Resources_Path_Remove 
 Remove  Resource_StackPanel_Retry	 �� Orientation 
 Replay  PopupWindow_ButtonRetry  Resource_StackPanel_Return 		 Close 
 PopupWindow_ButtonReturn  Resource_StackPanel_Finish  Download
 J� RenderTransformOrigin �� Angle  Button_Finish   Resource_StackPanel_Continue 
 Upload  Button_Continue . *Resource_StackPanel_AdministratorsLogin_Ok  Ok 
 App_Ok 2 .Resource_StackPanel_AdministratorsLogin_Cancel 
 Cancel  
App_Cancel - )Resource_StackPanel_AdministratorsSave_Ok 1 -Resource_StackPanel_AdministratorsSave_Cancel��%Q  &	        &	 *    7  &	 i    7  &	 �    7  &	 �    7 	 &	 �    7  &	 [    7  &	 �    7  &	 %    7  &	 [	    7  &	 �
    7  F� 5   
   ����� b�  � ���!�����!��!Ѡ���!� �  b� �`�b ��!�@KL ��!�@KL ����Ӡ  � �@KL `�b �@KL @KL �`�b @KL � � �Ӡ Ѡ�@KL ���!@KL ���!`�b � b�  � 	$ Uniform=�6�   $��50��6�   $��50��6�   $��	25,25,0,0q�6�   ��6!   �� $ Button_Exit��$ 
Foreground�6�   F� 5   
   8��  
�������$��10��6S   $ Uniform=�6_   F� 5   
   8��  
�������$��15��6Y   $ Uniform=�6d   �� 5   
   $	 
Horizontal=�67   .+�5      F� $ Uniform=�6   $��15��6%   8��  ��6P   �� $ Button_Retry��$ 
Foreground��� 5      $��6,0,0,0q�6   $��Center=�6i   #���  6�   ��6)   �� $ Button_Retry��$ 
Foreground�6�   5      �� 5   
   $	 
Horizontal=�68   .+�5      F� $ Uniform=�6   $��15��6%   8��  ��6O   �� $ Button_Return��$ 
Foreground��� 5      $��6,0,0,0q�6   $��Center=�6j   #��� 
 6�   ��6)   �� $ Button_Return��$ 
Foreground�6�   5      �� 5!   
   $	 
Horizontal=�68   .+�5"      F� $ Uniform=�6   $��15��6%   8��  $
 0.5,0.5&�6�   ��6R   �� $ Button_Finish��$ 
Foreground�z�5#      V� 5$      .~�5%      �� �� 5&      �� 5'      $	 -90Q�6*   T� 5(      5)      5+      �� 5,      $��10,0,0,0q�6   $��Center=�6k   #���  6�   ��6*   �� $ Button_Finish��$ 
Foreground�6�   5-      �� 5/   
   $	 
Horizontal=�6:   .+�50      F� $ Uniform=�6   $��15��6%   8��  $
 0.5,0.5&�6�   ��6P   �� $ Button_Continue��$ 
Foreground�z�51      V� 52      .~�53      �� �� 54      �� 55      $ 90Q�6*   T� 56      57      59      �� 5:      $��10,0,0,0q�6   $��Center=�6m   #���  6�   ��6*   �� $ Button_Continue��$ 
Foreground�6�   5;      �� 5=   
   $	 
Horizontal=�6H   .+�5>      F� $ Uniform=�6   $��15��6%   8��  ��6L   �� $# Button_AdministratorsLogin_Ok��$ 
Foreground��� 5?      $��6,0,0,0q�6   $��Center=�6z   #���  6�   ��6)   �� $# Button_AdministratorsLogin_Ok��$ 
Foreground�6�   5@      �� 5B   
   $	 
Horizontal=�6L   .+�5C      F� $ Uniform=�6   $��15��6%   8��  ��6P   �� $' !Button_AdministratorsLogin_Cancel��$ 
Foreground��� 5D      $��6,0,0,0q�6   $��Center=�6~   #���  6�   ��6)   �� $' !Button_AdministratorsLogin_Cancel��$ 
Foreground�6�   5E      �� 5G   
   $	 
Horizontal=�6G   .+�5H      F� $ Uniform=�6   $��15��6%   8��  ��6L   �� $" Button_AdministratorsSave_Ok��$ 
Foreground��� 5I      $��6,0,0,0q�6   $��Center=�6y   #���  6�   ��6)   �� $" Button_AdministratorsSave_Ok��$ 
Foreground�6�   5J      �� 5L   
   $	 
Horizontal=�6K   .+�5M      F� $ Uniform=�6   $��15��6%   8��  ��6P   �� $&  Button_AdministratorsSave_Cancel��$ 
Foreground��� 5N      $��6,0,0,0q�6   $��Center=�6}   #���  6�   ��6)   �� $&  Button_AdministratorsSave_Cancel��$ 
Foreground�6�   5O      5R      .��5S      (� $	��600��6   $	��900��6    (� Stretch$
 Fill=�6'   .��5T   
   ��   	BlueColor#��[ 6   $��2q�6:   ._�5U      ]� -   5         ]�Name$ DockPanel_Background��5U      ��. $	��450��6K   $	��300��6W      RectangleContainerBackground#��[ 6d   .+�5V      ]� -   5        $ StackPanel_Head��5V      #��[ 66   $��32��6^   ��. $	��Top=�6�   .+�5W      �� $��10,1,0,2q�6   $
��Left=�6.   $+��%/RDS;component/Apps/Images/RdLogo.png��6D   �� 5X      $��18(�6=   $
��Bold"�6K   $��	-60,0,0,0q�6]   $��Center=�6p   $��Center=�6�   
���������6    �� *
PopupTitle+6�   5Y      �� 5[       �� SelectedIndex 6   �� *PopupTypeIndex+ �� Mode$ OneWay=���6R   Z� ��6h   Z� .@�5\      �� -   5         ��Name$ TabItem_NoButton��5\      $��.1��68   $��0��6D   .��5]      ]� $	��450��6$   .+�5^      �� $��	20,0,20,0q�6(     TextBlockStyle#��[ 6;   $��Center=�6d   $��Center=�6�   $
��Wrap=�6�   ��6�   �� *	Message+6�   5_      5`      �� 5a      -   5        $ TabItem_OneButton��5a      $��.1��69   $��0��6E   .��5b      ]� ��. $	��450��69   .+�5c      �� $��Bottom=�6%     RD_ButtonBrightStyle#��[ 6=   #���  6k   $��0��6�   $��0,0,0,10q�6�   $	��100��6�   $��30��6�   ��6�   �� *	Command+6�   �� 5d      $��Bottom=�6#     	LineStyle#��[ 6;   	 �� X1$ 0��6^   	 �� X2$	 446��6e   $��2,0,2,10q�6o   � 5e      .+�5f   "   �� $��	20,0,20,0q�6,   #��[ 6?   $��Center=�6h   $��Center=�6�   $
��Wrap=�6�   ��6�   �� *	Message+6�   5g      5h      5i      �� 5j      -   5        $ TabItem_TwoButton��5j      $��1��69   $��0��6D   .��5k      ]� ��. $	��450��69   .+�5l      �� $	 
Horizontal=�6)   $��Bottom=�6B   $��Center=�6Z   .+�5m   "   �� -   5         ��Name$ Button_Retry��5m   )   $��Bottom=�6?   #��[ 6W   $��0��6�   $��0,0,0,10q�6�   $	��100��6�   $��30��6�   ��6�   �� *	Command+6�   �� 5n   "   -   5        $ Button_Return��5n   )   $��Bottom=�6@   #��[ 6X   $��1��6�   $��	30,0,0,10q�6�   $	��100��6�   $��30��6�   ��6�   �� *	Command+6�   5o      �� 5p      $��Bottom=�6#   #��[ 6;   $ 0��6^   $	 446��6e   $��2,0,2,10q�6n   � 5q      .+�5r   "   �� $��	20,0,20,0q�6,   $��WrapWithOverflow=�6?   #��[ 6_   ��6�   �� *	Message+5s      5t      5u      �� 5v      -   5        $ TabItem_ThreeButton��5v      $��1��6;   $��0��6F   .��5w      ]� ��. $	��450��69   .+�5x      �� $	 
Horizontal=�6)   $��Bottom=�6B   $��Center=�6Z   .+�5y   "   �� -	   5        $ 
Button_One��5y   )   $��Bottom=�6=   #��[ 6U   $��0��6�   $��0,0,0,10q�6�   $	��100��6�   $��30��6�   ��6�   �� *	Command+6�   �� 5z   "   -
   5        $ 
Button_Two��5z   )   $��Bottom=�6=   #��[ 6U   $��1��6�   $��	30,0,0,10q�6�   $	��100��6�   $��30��6�   ��6�   �� *	Command+6�   �� 5{   "   -   5        $ Button_Three��5{   )   $��Bottom=�6?   #��[ 6W   $��2��6�   $��	30,0,0,10q�6�   $	��100��6�   $��30��6�   ��6�   �� *	Command+6�   5|      �� 5}      $��Bottom=�6#   #��[ 6;   $ 0��6^   $	 446��6e   $��2,0,2,10q�6n   � 5~      .+�5   "   �� $��	20,0,20,0q�6,   $��WrapWithOverflow=�6?   #��[ 6_   ��6�   �� *	Message+5�      5�      5�      �� 5�      -   5        $ TabItem_CircleProgress��5�      $��1��6>   $��0��6I   .��5�        RDSCL.RD_CircleProgress  #��[ 62   $��80��6Z   $��80��6e   5�      5�      5�      5�      5�      5�      