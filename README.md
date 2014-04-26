BetterLocalizator
=================

[iOS] A helper library to force the strings localization to a specific language


### SCENARIO

![image](./screenshots/before.png "Before")

![image](./screenshots/after.png "After")

### Easy to use

1. Import the library to your project.

2. Put this code in the `Prefix.pch` (OPTIONAL):

    ```
    #import "TTBetterLocalizator.h"
    #define LS(s)               [BetterLocalizator localizedStringForKey:s alternative:s]   // EASY SHORTCUT
    ```
    or alternatively:
    ```
    #define LS(s,a)               [BetterLocalizator localizedStringForKey:s alternative:a]
    ```

3. Add this code in the main (`main.m`)function (I think you want this early in your application's startup):

    ```
    int main(int argc, char *argv[])
    {
        @autoreleasepool {
        
            // What's the best language option?
            NSArray *supportedLangs = @[ @"en", @"es" ];
            NSString *bestLang = supportedLangs[0];
            for (NSString *lang in [NSLocale preferredLanguages]) {
                if ([supportedLangs containsObject:lang]) {
                    bestLang = lang;
                    break;
                }
            }
            [BetterLocalizator setLanguage:bestLang];
            
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
    }
    ```

4. Changes your `NSLocalizedString(@"word")` invocations to `LS(@"word")` or `[BetterLocalizator localizedStringForKey:@"word" alternative:@"altWord"]`.


Reference & Credits
-------------------
* [StackOverFlow](http://stackoverflow.com/questions/1669645/how-to-force-nslocalizedstring-to-use-a-specific-language)

