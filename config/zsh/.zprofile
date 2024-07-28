# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"
# >>> coursier install directory >>>
export PATH="$PATH:/Users/t.eichholz/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# .NET
export PATH="$PATH:/Users/t.eichholz/.dotnet/tools"

# OP Openai Reference
export OPENAIKEY="op://Personal/OpenAI/Anmeldedaten"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
