Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D66C22405F
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 18:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgGQQNQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 12:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgGQQNQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 12:13:16 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01C6C0619D2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:15 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id br7so11435877ejb.5
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+/MdmslAL8XDkKUcwFjPqDr0PHJvjN1fSeVORGNgI0Q=;
        b=Y9jh1LaIEs854ygsBh3BPwxu/jNnd4OMPBYPWOtjGUe0UVApFXMouoskPgGDIlJJvY
         KsVdLzPIf8v1p5xgbk/lVRqLzweq4XreNseJJfP7gdvj60lDQ9wBsJ3v6nBC2pESbqzo
         WpGAnCwh2qmXeZdmdP2d/FQ05JZJzqoy3CZcncTg45zX1jghVAvyv/Q62JGp52GdiYeO
         cnEoYNM1YycgN4qcCOWY/qPwJ2x74fB3NZZiCjRh8TZrof/xrYm86G1g+aOQz9Fb8To1
         XkcM7pFzLp5e7Rzz18YYq08Tm3rFe8wleEB/Y+jZlL2EGV9Hpx1s0cxdo6Jft+qSDK8A
         U+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+/MdmslAL8XDkKUcwFjPqDr0PHJvjN1fSeVORGNgI0Q=;
        b=aQIML1Qum/m34D/3faYZLz12DnNo9B3LgbqGZmFQGOm839he/rDksUX2hMyaX33HYG
         RX62dCd6tuk9UtHvYwaFZUDhHuKYjI2XibXJ6+mO2TDAugndBYg+pPLMaox2fzNR/pM0
         kjFETHtY+gAkt6QXay1PdIULuW5esOziwVhpEEVcgbyhMvWe6APcNx49zDGcY/oLf0Ye
         SGYUfR/WH0CDscq2eB+vs/uuZ5Nn37h7QDTpFBqKGqTm+mP00DaI7CXC7u1HxMKb0ceF
         2KfwNWUvZiob0zoafZ1dFstZu/Y0sEn8tNNAO1SJuWJVzLV7eUxhCe2F4lqp/Menhdhl
         eyjw==
X-Gm-Message-State: AOAM533YDNU480I14Ss1yAtLkFJhZcy4qTohtb/yOepgygz5TzB/R05j
        Ob3T5t869M1V2JKQxueqTJw=
X-Google-Smtp-Source: ABdhPJxlad2HXjREhA60i10nlG8YZlbg1MRva5xRRMydTx+ENksKaK/79v2RUz3Afml6mzdn6ekX3Q==
X-Received: by 2002:a17:906:86d4:: with SMTP id j20mr9940467ejy.68.1595002394516;
        Fri, 17 Jul 2020 09:13:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o15sm8573329edv.55.2020.07.17.09.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:13:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] ARM: tegra: Default configuration changes for v5.9-rc1
Date:   Fri, 17 Jul 2020 18:12:59 +0200
Message-Id: <20200717161300.1661002-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717161300.1661002-1-thierry.reding@gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-arm-defconfig

for you to fetch changes up to 3a3cb021b0380e2cbf7e1d158c37402874b54a9a:

  ARM: tegra_defconfig: Enable options useful for Nexus 7 and Acer A500 (2020-07-16 14:22:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.9-rc1

Enables a few new configuration options that are useful on the new Nexus
7 and Acer A500 devices, as well as the userspace CPU frequency governor
that's mainly used for testing.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra_defconfig: Enable options useful for Nexus 7 and Acer A500

Jon Hunter (1):
      ARM: tegra: Enable CPUFREQ userspace governor

 arch/arm/configs/tegra_defconfig | 43 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
