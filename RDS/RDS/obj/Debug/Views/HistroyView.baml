   M S B A M L   `   `   `  ����  RDS    RDS.Views.HistroyView   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5        � 	Resources  5         Resource_StackPanel_Strecth �� Orientation �� Stretch  FileStretch �� ElementName �� Path  HistroyView_Button_Stretch  Resource_StackPanel_Import  
FileImport  HistroyView_Button_Import��%8  &	        7  &	     7  �� 5	   
   $ 
Horizontal=�69   .+�5
      F� $ Uniform=�6   $��15��6%   8��  ��6T   �� $ Button_Search��$ 
Foreground��� 5      $��6,0,0,0q�6   $��Center=�6j   #���  6�   ��6)   �� $ Button_Search��$ 
Foreground�6�   5      �� 5   
   $ 
Horizontal=�68   .+�5      F� $ Uniform=�6   $��15��6%   8��  ��6S   �� $ Button_Import��$ 
Foreground��� 5      $��6,0,0,0q�6   $��Center=�6j   #���  6�   ��6)   �� $ Button_Import��$ 
Foreground�6�   5      5      .��5      (�  (� Stretch$
 Fill=�6   .��5   
   �� $	��950��6   $	��500��6   .+�5      &   System.Windows.Controls.DataGrid  -   5          Name$ DataGrid_ReportName��5        RD_DataGridBrightStyle#��[ 65   $��10q�6e   $��0��6r    �� Left$ 20��6   
 �� Top$ 10��6�   $	��890��6�   $	��390��6�   $
��Left=�6�   	   CanUserAddRows	 .  6�   �� 5      $��1��6   $ 
Horizontal=�6&   $ 60��6?   $	 450��6P   .+�5      �� $��70��6     HistroyView_Name#���  6'     TextBlockStyle#��[ 6Q   $��10,0,0,0q�6y   $��Center=�6�   �� 5       	 RD_TextBoxBrightStyle#��[	 6   $	��100��6I   $��30��6U   $��2,0,0,0q�6a   �� 5      #��[ 6   $��50��6D    
 HistroyView_Type#��� 
 6O   $��30,0,0,0q�6y   $��Center=�6�   �� 5      #��[	 6   $	��100��6I   $��30��6U   $��2,0,0,0q�6a   �� 5      $��50��6     HistroyView_Date#���  6'   #��[ 6Q   $��30,0,0,0q�6y   $��Center=�6�   �� 5      #��[	 6   $	��100��6I   $��30��6U   $��2,0,0,0q�6a   �� 5       -   5        
 ��Name$
 Button_Search��5         RD_ButtonBrightStyle#��[ 60   $	��100��6^   $��30��6j   #��[  6v   $��50,0,0,0q�6�   6�   �� 5!      -   5        $
 Button_Import��5!      #��[ 60   $	��100��6^   $��30��6j   #��[ 6v   $��10,0,0,0q�6�   5#      �� 5$        	LineStyle#��[ 6   	 �� X1$ 0��66   	 �� X2$	 890��6=   $��1��6F   $ 30��6Z    �� Bottom$ 70��6k   5%      5&      5'      