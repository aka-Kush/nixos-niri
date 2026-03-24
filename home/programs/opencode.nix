{
  pkgs,
  ...
}:
{
  home.packages = [ pkgs.opencode ];

  xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    provider = {
      ollama = {
        npm = "@ai-sdk/openai-compatible";
        name = "Ollama (local)";
        options.baseURL = "http://localhost:11434/v1";
        models = {
          "qwen2.5-coder:14b" = {
            name = "qwen2.5-coder:14b";
            options = {
              num_ctx = 8192;
            };
          };
          "deepseek-r1:14b" = {
            name = "deepseek-r1:14b";
            options = {
              num_ctx = 8192;
            };
          };
          "qwen3.5:9b" = {
            name = "qwen3.5:9b";
            options = {
              num_ctx = 8192;
            };
          };
        };
      };
    };
    model = "ollama/qwen2.5-coder:14b";
  };
}
