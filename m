Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045F4137AA4
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgAKAgB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:36:01 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54889 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbgAKAgB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:36:01 -0500
Received: by mail-wm1-f65.google.com with SMTP id b19so3814320wmj.4
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RSHU/Gjykx5RiPSJKwAd769+/CbYqTNCLwQOYVIZDE=;
        b=ERadZNXtHeLEVB/nGJCNGxJCKf650aWi2+uaNXP6aepOkppqTZ3pECwwMbovFSogew
         ittF2avhfPnvE2HiiaXl9qvRiAOzl8e9E49/hDsakaholmd7pvYd+n+ri+CdeFFyICHa
         mNcKIjd475m0ABrw81nkkfzGpaIff4uVxr5xoFb6La49DWk9OqR6G3NaxQ4vZKtp1Mni
         +kZLqVaVRlVhw4pVu63SeaLSbJkl2jtyYjRoXMqpHVccWsNGgkPEyfjZdRSjVwYJFmkC
         3tG8WQPjYKclvhpCZF6iIisdqjWxm1JgN8uDOaJth+syxno5Uuao55srTKW7ZKr7cI+5
         A5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RSHU/Gjykx5RiPSJKwAd769+/CbYqTNCLwQOYVIZDE=;
        b=h61tTHzjMh5r1Ey/exLQs22I1kTLKfI584zcpsi0oMNfOnu/fjp1dsmUfIr8LW8Xkw
         PR3YOoLgTgBvEW0R2YTpOQvXG35IsJv50Qje5sxXn5PGdxPhHmVaO14Kx8AIEVzI44Pg
         a90gnjahkDdDxjMINrHjs0Y6kCFb5elLwHchp07OrFKchuAX/gx4Nj2Hh1bJdop8q/cv
         WwG32v2RrNbKdXMvcOBnfgXV78VUhwEgGvbNb264znolOOG3VLMZUJiiCYgRI8yNAzXJ
         0AeGvd0qGIKQsTtKaI1oaL4bRlhm7yLTms3SD+FmietC/ENWB2L/2SsMRhijr5wUZO6J
         R+Cw==
X-Gm-Message-State: APjAAAXwFEmfzjqNLpZimjzulvb8HSYwkejJ8dI2eWxjWvJ7e5KSEFw2
        hSH0jQNAP9YqzYNU27M07g0=
X-Google-Smtp-Source: APXvYqxCARR2IUXPDubme7stKDBpuSN4faHHx4d8JlnhwSwxzvRKE024F8cy+T+vNiUEjDapDgXhVA==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr6800004wml.103.1578702960198;
        Fri, 10 Jan 2020 16:36:00 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id u18sm4169773wrt.26.2020.01.10.16.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:35:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] bus: tegra: Changes for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:35:47 +0100
Message-Id: <20200111003553.2411874-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111003553.2411874-1-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-bus

for you to fetch changes up to 2f56acf818a08a9187ac8ec6e3d994fc13dc368d:

  bus: tegra-aconnect: Remove PM_CLK dependency (2020-01-10 12:31:24 +0100)

Thanks,
Thierry

----------------------------------------------------------------
bus: tegra: Changes for v5.6-rc1

Contains a single fix to remove a Kconfig dependency that's no longer
required.

----------------------------------------------------------------
Sameer Pujar (1):
      bus: tegra-aconnect: Remove PM_CLK dependency

 drivers/bus/Kconfig | 1 -
 1 file changed, 1 deletion(-)
