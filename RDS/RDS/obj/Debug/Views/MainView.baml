   M S B A M L   `   `   `  ����@  <RDSCL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null,"clr-namespace:RDSCL;assembly=RDSCLRDSCL  5       RDS   RDS.Views.MainView   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      4rdscl"clr-namespace:RDSCL;assembly=RDSCL     5        � 	Resources  5	         BodyBackground �� Color  	Path_Exit 	 Close �� Stretch �� ElementName �� Path  Path_Administrators  AccountSettingsVariant  Path_Minimize  Minimize  Path_Information  Information 	 LabelButton_Content_Task �� Orientation 
 Monitor  MainView_CurrentTask  LabelButton_Content_Histroy  Histroy  MainView_Histroy  LabelButton_Content_Help  Help  MainView_Help��%/  &	        &	      7  &	 �     7  &	 [    7  &	 �    7  &		 �    7 
 &	 �    7  &	 n    7  �� 5   
   $ White��61   F� 5   
   8��  $ UniformToFill=�6y   $��17��6�   $��6,6,0,0q�6�   ��6!   �� $ Button_Exit��$ 
Foreground�6�   F� 5   
   8��  $��Center=�6�   $��Center=�6�   $ UniformToFill=�6�   $��20��6�   $��3,3,0,0q�6  ��6+   �� $# Button_AccountSettingsVariant��$ 
Foreground�6  F� 5   
   8��  $ UniformToFill=�6�   $��20��6�   $��4,12,0,0q�6�   ��6%   �� $ Button_Minimize��$ 
Foreground�6�   F� 5   
   8��  $��Center=�6�   $��Center=�6�   $ Uniform=�6�   $��30��6�   $��20��6�   $��-1,4,0,0q�6�   ��6(   �� $ Button_Information��$ 
Foreground�6�   �� 5   
   $��Center=�66   $ 
Horizontal=�6S   $��	40,10,0,0q�6l   .+�5      F� $ Uniform=�6N   $��80��6`   $��60��6k   8��  ��6   �� $ CheckBox_Task��$ 
Foreground�6x   �� 5      $��38(�6Y   $
��Bold"�6g   #���  6y   $��20,5,0,0q�6�   ��6   �� $ CheckBox_Task��$ 
Foreground�6�   5      �� 5   
   $��Center=�69   $ 
Horizontal=�6V   $��	40,10,0,0q�6o   .+�5      F� $ Uniform=�6Q   $��80��6c   $��60��6n   8��  $��Center=�6�   $��Center=�6�   ��6   �� $ CheckBox_Histroy��$ 
Foreground�6�   �� 5      $��38(�6\   $
��Bold"�6j   #���  6|   $��20,5,0,0q�6�   ��6   �� $ CheckBox_Histroy��$ 
Foreground�6�   5      �� 5   
   $��Center=�66   $ 
Horizontal=�6S   $��	40,10,0,0q�6l   .+�5      F� $ Uniform=�6N   $��80��6`   $��60��6k   8��  ��6   �� $ CheckBox_Help��$ 
Foreground�6w   �� 5      $��38(�6Y   $
��Bold"�6g   #���  6y   $��20,5,0,0q�6�   ��6   �� $ CheckBox_Help��$ 
Foreground�6�   5      5       .��5!      (�  (� Stretch$
 Fill=�6   .��5"   
   � $
��1900��6   $
��1000��6   .+�5#      ]� $
��1900��6   $
��1000��6%   ��. .+�5$      �� -   5         ��Name$ StackPanel_Head��5$        	BlueColor#��[ 63   $��80��6[   $	��Top=�6h   .+�5%      �� $��UniformToFill=�6   $��70��64   
 �� Top$ 5��6@   	 �� Left$	 30��6O   $+��%/RDS;component/Apps/Images/RdLogo.png��6`   �� 5&      -   5        
 ��Name$
 Button_Exit��5&        RD_EllipseButtonStyle#��[ 63   #��[ 6b   $��55��6�   $��55��6�    �� Right$ 20��6�   $ 10��6�   $	��100(�6�   ��6�   �� *	ExitApp+6�   �� 5'      -   5        $
 Button_Minimize��5'      #��[ 67   #��[ 6�   $��55��6�   $��55��6�   $	 100��6�   $ 10��6�   $	��100(�6�   ��6f   �� *ShowCricleProgress+6   �� 5(      -   5        $
 Button_Information��5(      #��[ 6:   #��[ 6j   $��55��6�   $��55��6�   $	 180��6�   $ 10��6�   $	��100(�6�   6�   �� 5)      -   5        $#
 Button_AccountSettingsVariant��5)      #��[ 6q   #��[ 6�   $��55��6�   $��55��6�   $	 260��6�   $ 10��6�   $	��100(�6  ��6E   �� *ShowAdministratorsLogin+6  �� 5*      -   5         ��Name$ CheckBox_Task��5*        RD_LabelButtonBrightStyle#��[ 66   #��[	 6�   $		 400��6�   $	��350��6�   $��81��6�    d� 	IsChecked 6i   �� *IsTask+6�   �� 5+      -   5        $ CheckBox_Histroy��5+      #��[ 69   #��[ 6�   $		 750��6�   $	��350��6�   $��81��6�    6l   �� *	IsHistroy+6�   �� 5,      -   5        $ CheckBox_Help��5,      #��[ 66   #��[ 6�   $
	 1100��6�   $	��350��6�   $��81��6�    6i   �� *IsHelp+6�   5.      �� 5/      -	   5         ��Name$# ContentControl_CurrentContent��5/   !   50      51      52      53      