﻿using System;
using System.Windows.Controls;
using System.Windows;
using RDS.Views;
using System.Configuration;
using System.Collections.Generic;
using System.Windows.Media;

namespace RDS.ViewModels.Common
{
	static class General
	{
		public static Sdk SDK { get; set; } = new Sdk();

		public static SolidColorBrush GreenColor { get { return (General.FindResource(Properties.Resources.GreenColor) as SolidColorBrush); } }

		public static SolidColorBrush WathetColor { get { return (General.FindResource(Properties.Resources.WathetColor) as SolidColorBrush); } }

		private static MainWindow mainWindow;

		private static PopupWindow popupWindow;

		private static SetupView setupView;

		public static List<string> UsedReagents { get { return General.setupView.ViewModel.UsedReagents; } }

		public static void ShutDown()
		{
			Application.Current.Shutdown();
		}

		public static void InitializePopupWindow(PopupWindow popupWindow)
		{
			General.popupWindow = popupWindow;
			General.popupWindow.InitializeLanguage(mainWindow.ResourceDictionary);
		}

		public static void InitializeMainWindow(MainWindow mainWindow)
		{
			General.mainWindow = mainWindow;
		}

		public static void FindSetupView(SetupView setupView)
		{
			General.setupView = setupView;
		}

		public static void ChangeLanguage(ResourceDictionary resourceDictionary)
		{
			if (General.mainWindow.Resources.MergedDictionaries.Count > 0) General.mainWindow.Resources.MergedDictionaries.Clear();
			if (General.popupWindow.Resources.MergedDictionaries.Count > 0) General.popupWindow.Resources.MergedDictionaries.Clear();
			General.popupWindow.Resources.MergedDictionaries.Add(resourceDictionary);
			General.mainWindow.Resources.MergedDictionaries.Add(resourceDictionary);
		}

		public static string FindStringResource(string resourceKey)
		{
			return General.mainWindow.FindResource(resourceKey).ToString();
		}

		public static object FindResource(string resourceKey)
		{
			return General.mainWindow.FindResource(resourceKey);
		}

		public static PopupWindow PopupWindow(PopupType popupType, string message, Action[] actions)
		{
			if (actions == null) actions = new Action[3];
			//General.popupWindow.ViewModel.PopupWindow(popupType, message, actions);
			//General.popupWindow.Show();
			PopupWindow popupWindow = new PopupWindow();
			popupWindow.ViewModel.PopupWindow(popupType, message, actions);
			popupWindow.Show();
			return popupWindow;
		}



		public static void HidePoppedUpWindow()
		{
			General.popupWindow.Hide();
		}

		public static string ReadConfiguration(string configurationKey)
		{
			return ConfigurationManager.AppSettings[configurationKey].ToString();
		}

		public static bool WriteConfiguration(string configurationKey, string value)
		{
			var result = false;
			try
			{
				Configuration configuration = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
				configuration.AppSettings.Settings[configurationKey].Value = value;
				configuration.Save();
				result = true;
			}
			catch { }
			return result;
		}

		public static void ExitView(object oldContent, Window newContent, IExitView iExitView)
		{
			iExitView.ExitView = new Action(() => { newContent.Content = oldContent; });
			newContent.Content = iExitView;
		}

		public static void ExitView(object oldContent, UserControl newContent, IExitView iExitView)
		{
			iExitView.ExitView = new Action(() => { newContent.Content = oldContent; });
			newContent.Content = iExitView;
		}
	}
}
