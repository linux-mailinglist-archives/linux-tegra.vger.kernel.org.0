Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD24E19CC9
	for <lists+linux-tegra@lfdr.de>; Fri, 10 May 2019 13:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfEJLfw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 May 2019 07:35:52 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:33269 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfEJLfw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 May 2019 07:35:52 -0400
Received: by mail-wr1-f49.google.com with SMTP id e11so7519761wrs.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 May 2019 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//iVBOOHc9TqM1L3co+mOMGbYMsc6+9X4iK1zTDPBHc=;
        b=kbnyW3OeD2h2N5VTb+twEh/EtyCC5kEin8Rr5H8WKQ+jb7u4SZA3JE0D1L/FYgicw8
         9jMKdz6iZ6z70XVduliH722/B/SusXP2TK11kgJ+XeiPYgv12OZkPmVHFNw3bsVCusVD
         ZUftcLl6I74XCtUH0MwmkEljTTpnARFTVaxJt81qoT6lyHLbx3HIiYvJtO/YGHka4zKs
         v2NXecYHP280i5nX9BpmWbBmj48Y1GZEGaOoOvcqr8LA6iLf40bOz8YFZHrEU0/0r1n8
         cChmetZP4qwt4x78aPELgCPUvpnnH/rH0THObRMjhD8NOnQ2jqKMODPPNcc50hIqmz7X
         KPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//iVBOOHc9TqM1L3co+mOMGbYMsc6+9X4iK1zTDPBHc=;
        b=ge2OZpuJsTYdLau2wV5x1AceSKCnB3n7ujbfwlcB4WCreW0kFQS4E/i7KsGlPMEagn
         aSnSqyUvKdvR/573zIk52Lxbm43/VYQu7i3hFuV8d7jCEzYJqtLEvRJIH1HEdGEWMPA1
         M+beWQ+oMljwxe4EDtH7X8uEXRFtfeGo5C01o9RfomnB7WCCnyYAPLnYXd4+uzMHSILz
         pMVfw2pfiTErv6abAE5fFMhjRho+J4/skDaSGQLztOxXDGBBakAC8eAdEp7uQpIj+455
         /FL4A3o41iLwNte0t2I7lvkqY+eFKJMCqaEldWh3wy88HBpZmUYIaz6NXcF/tDj7Lr9K
         Mgfg==
X-Gm-Message-State: APjAAAU3ukxaYLuTrVrz/1p7soTRdyubUvctcTzvxKmAWh7xB/G/TmUL
        bOLTmdCb5KRTZkp/D0NrRQw=
X-Google-Smtp-Source: APXvYqzqR3dalAxAD4FQFC9rRf4MAqkKoi4x7exNR7vV1/72Son/ThfafFYEEMdEXnWpGTbFeAT/ZA==
X-Received: by 2002:adf:e44b:: with SMTP id t11mr7552779wrm.151.1557488150525;
        Fri, 10 May 2019 04:35:50 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id b8sm4407759wrr.64.2019.05.10.04.35.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 04:35:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] arm64: tegra: Core fixes for v5.2-rc1
Date:   Fri, 10 May 2019 13:35:45 +0200
Message-Id: <20190510113546.15698-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510113546.15698-1-thierry.reding@gmail.com>
References: <20190510113546.15698-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm64-soc-fixes

for you to fetch changes up to 2e988a83874b689f9e095cf60b40f1a8aff6731a:

  arm64: tegra: Select ARM_GIC_PM (2019-05-08 14:41:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Core fixes for v5.2-rc1

This enables the ARM_GIC_PM driver by default for Tegra in order to
increase build coverage.

----------------------------------------------------------------
Sameer Pujar (1):
      arm64: tegra: Select ARM_GIC_PM

 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)
