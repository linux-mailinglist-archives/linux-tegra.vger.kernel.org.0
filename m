Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B0D11D880
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Dec 2019 22:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731072AbfLLVZh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Dec 2019 16:25:37 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44213 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730902AbfLLVZg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Dec 2019 16:25:36 -0500
Received: by mail-lf1-f66.google.com with SMTP id v201so338493lfa.11
        for <linux-tegra@vger.kernel.org>; Thu, 12 Dec 2019 13:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=cfioP8TA6Qxn5hTnDGWlQXnlscIlc+Oj+KVTI7nJ630=;
        b=q9ZQcchLHv3SGiyoQEHnkwKhUoakKzqNaOWbi6H59YvWZwEebPKXsi22aLIe1Hgm7k
         J5UDAYaxxcafuug8V51WlYMq0QuGKZyveBciuj9MhgkCAkjtPOhFJUSGCJZ4kpgUK1sh
         GuzOfj1opHoB9HBj1yaSd6+u51m+TD9Cn0iRKrJENFLcb6kkKWAt5eAjSd9cZUeuD4B9
         ML4vqzAxrzNBJ42Ag9TK/b6uVokS3WwNYnKTOb5Khj6hrvH4mPNziTgpsHlP2H20Jws8
         rarQ326mfbRurc1nU1D6RZ3L3skNxHVYAvl0Xy558Sgw7LD/EVFQanzccD0sRMmbEo0k
         u5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=cfioP8TA6Qxn5hTnDGWlQXnlscIlc+Oj+KVTI7nJ630=;
        b=a4QJPyvq23s5lah8UHiOgFUiPoac6VNzDM5ggE2xgVJJ77lAtFQH5M8ACJQd51/LqT
         9ALuoPqVtlGhughKBnV7zu/CqxgHgvseWbsaEDw8OzWE/WKZheh6s6WkBvtoyq4Vo8nF
         hgT3ulMeCGr8tVEAZm9NV16eAi/pGtWDWt9WyJm7UqhkpIHZ/LZ36zz3MqgQHqAVcOuJ
         AiXcSjQBXuvftHZY2bSDuxYdPt2lLT0dBS1NbQ98wpe0NluoPihhUbqPbBBYmclbxNSZ
         k+WSce8KYyn8005tGoI0X8xWcxNCbTFLVgy145i5/aqbdg5jGcwT+mRnow96gXrqRPFl
         45sQ==
X-Gm-Message-State: APjAAAX0I5AQeOstEfEb8XU0C5AKe/L4+l086p6VnGfTvQ2pYmIG5X2Q
        QNavI6nplTG6IZr8kPHB7IuW6gDE
X-Google-Smtp-Source: APXvYqzLtZroQjuryJb8lSL+00HYlTr1/QqVaJGT9/s9FSf7zMAVpREbFJwso4UUFgliw8MCeM8vnQ==
X-Received: by 2002:a19:c648:: with SMTP id w69mr6925147lff.44.1576185935031;
        Thu, 12 Dec 2019 13:25:35 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id u13sm3496798lfq.19.2019.12.12.13.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 13:25:34 -0800 (PST)
To:     Thierry Reding <thierry.reding@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Subject: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Message-ID: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
Date:   Fri, 13 Dec 2019 00:25:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Thierry,

Commit [1] introduced a severe GPU performance regression on Tegra20 and
Tegra30 using.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.5-rc1&id=fa6661b7aa0b52073681b0d26742650c8cbd30f3

Interestingly the performance is okay on Tegra30 if
CONFIG_TEGRA_HOST1X_FIREWALL=n, but that doesn't make difference for
Tegra20.

I was telling you about this problem on the #tegra IRC sometime ago and
you asked to report it in a trackable form, so finally here it is.

You could reproduce the problem by running [2] like this
`grate/texture-filter -f -s` which should produce over 100 FPS for 720p
display resolution and currently it's ~11 FPS.

[2]
https://github.com/grate-driver/grate/blob/master/tests/grate/texture-filter.c

Previously I was seeing some memory errors coming from Host1x DMA, but
don't see any errors at all right now.

I don't see anything done horribly wrong in the offending commit.

Unfortunately I couldn't dedicate enough time to sit down and debug the
problem thoroughly yet. Please let me know if you'll find a solution,
I'll be happy to test it. Thanks in advance!
