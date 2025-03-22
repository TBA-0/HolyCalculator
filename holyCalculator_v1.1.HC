#include <raylib.h>
#include <raygui.h>
#include <math.h>

#define MAX_DIGITS 20

int main() {
    const int screenWidth = 300;
    const int screenHeight = 500;
    InitWindow(screenWidth, screenHeight, "HolyCalculator by TBA v.1.1");
    SetTargetFPS(60);

    char displayText[MAX_DIGITS] = "0";

    char operation = '\0';
    float num1 = 0.0f;
    float num2 = 0.0f;
    bool inputNewNumber = true;

    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(RAYWHITE);

        GuiLabel((Rectangle){ 10, 10, screenWidth - 20, 40 }, displayText);

        if (GuiButton((Rectangle){ 10, 60, 70, 50 }, "7")) { 
            if (inputNewNumber) { strcat(displayText, "7"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 90, 60, 70, 50 }, "8")) { 
            if (inputNewNumber) { strcat(displayText, "8"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 170, 60, 70, 50 }, "9")) { 
            if (inputNewNumber) { strcat(displayText, "9"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 10, 120, 70, 50 }, "4")) { 
            if (inputNewNumber) { strcat(displayText, "4"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 90, 120, 70, 50 }, "5")) { 
            if (inputNewNumber) { strcat(displayText, "5"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 170, 120, 70, 50 }, "6")) { 
            if (inputNewNumber) { strcat(displayText, "6"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 10, 180, 70, 50 }, "1")) { 
            if (inputNewNumber) { strcat(displayText, "1"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 90, 180, 70, 50 }, "2")) { 
            if (inputNewNumber) { strcat(displayText, "2"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 170, 180, 70, 50 }, "3")) { 
            if (inputNewNumber) { strcat(displayText, "3"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 10, 240, 70, 50 }, "0")) { 
            if (inputNewNumber) { strcat(displayText, "0"); inputNewNumber = false; }
        }
        if (GuiButton((Rectangle){ 90, 240, 70, 50 }, ".")) { 
            if (inputNewNumber) { strcat(displayText, "."); inputNewNumber = false; }
        }

        if (GuiButton((Rectangle){ 250, 60, 40, 50 }, "+")) { 
            operation = '+'; 
            num1 = atof(displayText); 
            memset(displayText, 0, sizeof(displayText)); 
        }
        if (GuiButton((Rectangle){ 250, 120, 40, 50 }, "-")) { 
            operation = '-'; 
            num1 = atof(displayText); 
            memset(displayText, 0, sizeof(displayText)); 
        }
        if (GuiButton((Rectangle){ 250, 180, 40, 50 }, "*")) { 
            operation = '*'; 
            num1 = atof(displayText); 
            memset(displayText, 0, sizeof(displayText)); 
        }
        if (GuiButton((Rectangle){ 250, 240, 40, 50 }, "/")) { 
            operation = '/'; 
            num1 = atof(displayText); 
            memset(displayText, 0, sizeof(displayText)); 
        }

        if (GuiButton((Rectangle){ 250, 300, 40, 50 }, "^")) { 
            operation = '^'; 
            num1 = atof(displayText); 
            memset(displayText, 0, sizeof(displayText)); 
        }
        if (GuiButton((Rectangle){ 90, 300, 70, 50 }, "√")) { 
            operation = '√'; 
            num1 = atof(displayText); 
            memset(displayText, 0, sizeof(displayText)); 
        }
        if (GuiButton((Rectangle){ 170, 300, 70, 50 }, "%")) { 
            operation = '%'; 
            num1 = atof(displayText); 
            memset(displayText, 0, sizeof(displayText)); 
        }

        if (GuiButton((Rectangle){ 170, 360, 70, 50 }, "=")) {
            num2 = atof(displayText);
            switch (operation) {
                case '+': sprintf(displayText, "%.2f", num1 + num2); break;
                case '-': sprintf(displayText, "%.2f", num1 - num2); break;
                case '*': sprintf(displayText, "%.2f", num1 * num2); break;
                case '/': 
                    if (num2 != 0) sprintf(displayText, "%.2f", num1 / num2); 
                    else strcpy(displayText, "ERROR");
                    break;
                case '^': sprintf(displayText, "%.2f", pow(num1, num2)); break;
                case '√': 
                    if (num1 >= 0) sprintf(displayText, "%.2f", sqrt(num1)); 
                    else strcpy(displayText, "ERROR");
                    break;
                case '%': sprintf(displayText, "%.2f", num1 * (num2 / 100)); break;
            }
            inputNewNumber = true;
        }

        if (GuiButton((Rectangle){ 10, 360, 70, 50 }, "C")) {
            memset(displayText, 0, sizeof(displayText));
            strcpy(displayText, "0");
        }

        EndDrawing();
    }

    CloseWindow();

    return 0;
}
