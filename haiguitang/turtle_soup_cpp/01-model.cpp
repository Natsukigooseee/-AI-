#include "openai.hpp"
#include "nlohmann/json.hpp"
#include <iostream>
#include <vector>

int main() {
    openai::start("sk-on-Jo5FAGExsug1vrAvXCQ", "", true, "https://agino.me/"); 
    std::vector<nlohmann::json> previous_messages = {
        {
            {"role", "system"},
            {"content", "你好，我是ChatGPT。请问有什么我可以帮助你的吗？"}
        }
    };
    std::string user_input;
    bool keep_talking = true;
    
    //前置内部对话
    previous_messages.push_back({{"role", "user"}, {"content", "海龟汤游戏是一种推理游戏，其玩法大致如下：出题者：给出一个不完整的故事（汤面），这个故事中通常包含一些难以直接理解的元素或情节。答题者：通过提问问题来试图还原故事的完整内容（汤底）。答题者可以提出任何问题，而出题者只能回答“是”、“不是”或“与此无关”来提供线索。目标：答题者需要通过不断提问和收集线索，最终揭示出故事的完整内容和背后的真相。当我是出题者，我会向你提供一个汤面，然后你每次只能提出一个问题，你提的问题是为了让你自己去还原整个故事，同时，你提的问题我只能回复“是”、“不是”或“与此无关”。所以你的问题应该让我更好回答。如果你实在不知道汤底，可以给我说“请公布汤底”。接下来，我们一起玩海龟汤游戏吧！请你说“我们一起玩海龟汤吧，请给我一个汤面”？"}});
    nlohmann::json request_json = {
            {"model", "gpt-3.5-turbo"},
            {"messages", previous_messages},
            {"max_tokens", 4096},
            {"temperature", 0.0} 
        };
    auto completion = openai::chat().create(request_json);
    
    if (completion.contains("choices") && !completion["choices"].empty()) {
            const nlohmann::json& firstChoice = completion["choices"][0];
            if (firstChoice.contains("message") && firstChoice["message"].contains("content")) {
                if (firstChoice["message"]["content"].is_string()) {
                    std::string content = firstChoice["message"]["content"].get<std::string>();
                    std::cout << "【模式二】龟探长回复: " << content << '\n';
                } else {
                    std::cout << "The 'content' field is not a string.\n";
                }
            } else {
                std::cout << "The 'message' object or 'content' field does not exist in the first choice.\n";
            }
        } else {
            std::cout << "The 'choices' array is empty or does not exist.\n";
        }

    while (keep_talking) {
        std::cout << "请输入你的问题或对话内容（输入'退出'结束对话）: ";
        std::getline(std::cin, user_input);

        if (user_input == "退出") {
            keep_talking = false;
            break;
        }
        previous_messages.push_back({{"role", "user"}, {"content", user_input}});
        nlohmann::json request_json = {
            {"model", "gpt-3.5-turbo"},
            {"messages", previous_messages},
            {"max_tokens", 4096},
            {"temperature", 0.0} 
        };

        auto completion = openai::chat().create(request_json);

        if (completion.contains("choices") && !completion["choices"].empty()) {
            const nlohmann::json& firstChoice = completion["choices"][0];
            if (firstChoice.contains("message") && firstChoice["message"].contains("content")) {
                if (firstChoice["message"]["content"].is_string()) {
                    std::string content = firstChoice["message"]["content"].get<std::string>();
                    std::cout << "【模式二】龟探长回复: " << content << '\n';
                } else {
                    std::cout << "The 'content' field is not a string.\n";
                }
            } else {
                std::cout << "The 'message' object or 'content' field does not exist in the first choice.\n";
            }
        } else {
            std::cout << "The 'choices' array is empty or does not exist.\n";
        }
        previous_messages.push_back({{"role", "system"}, {"content", "好的，请继续..."}}); 
    }

    return 0;
}