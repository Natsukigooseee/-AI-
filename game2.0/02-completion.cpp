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
    previous_messages.push_back({{"role", "user"}, {"content", "模拟人生游戏规则： 你要自己创建一个具有特定性格和背景的角色，让玩家与之进行互动。 就像是模拟人生，在每一次问答，就是模拟这个人物角色每一个人生阶段，你需要给出不同的选择，而玩家的不同选择会导致最后的人生走向不同。请你创建这样一个角色吧！当玩家说“结束模拟人生”，你需要给出玩家这个角色这一生的经历与结果。"}});
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
                    std::cout << "角色扮演机器人回复: " << content << '\n';
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
                    std::cout << "角色扮演机器人回复: " << content << '\n';
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