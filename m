Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC66CC4BC
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Oct 2019 23:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbfJDVV1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Oct 2019 17:21:27 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37340 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730131AbfJDVV1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Oct 2019 17:21:27 -0400
Received: by mail-lf1-f68.google.com with SMTP id w67so5434109lff.4
        for <linux-tegra@vger.kernel.org>; Fri, 04 Oct 2019 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OEr/bFV3Od5HcrZnG2EJ9f+c1Io5H/tUIvwwsgn09DA=;
        b=QFNuvKWQbPlZmPs9n2F0eVA+YgD9EtctMySi94fMISEpBd80YJi6m2xw+a5hYnDZ4y
         68FiPlqsMB5vjrVd1JwRpX1DC/OlyexaxS25+syv1cSY4RNBGTkVFEA4oJzycyqZdFMC
         zdOgogn0guvw65iq5yALaQK44zYKvRDt71GOa2s86ejeJIy8mWidB0HsEEy94lPFbnD/
         lmG1v0xS0tbG6XYQK97IBrVdiPxBGtewjO0KK1fL8ldyUnjnkcOT0L1b+y6d1PyFzh4M
         mGSAVl8AwBwYLoUngJ5yzOD4nT7w7z18MoVxsuQxdICDc4GI4Guebj4xAZGe59TDM1zv
         qtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEr/bFV3Od5HcrZnG2EJ9f+c1Io5H/tUIvwwsgn09DA=;
        b=dWkOeS8+RIbtKN12JFMU6FiCDM/OLLqcTeg0p+OkZlREo/VvuRVU5G/6DblsyBzugZ
         F9iUeeMHXCXya3w7a1D23fkMugja7RLq/mCw3E2zvD+Z72QD2Hg2DvBF3aa2Y22ihwiE
         PUZmHpGNK15oP53cI7cMSnvWuWi5oNEX9oHasI7GYcbCTLfZeNqpzJNvfYX6vWKDoFQw
         FEZCAIlMHOTBBmw60UDjlUsyYSeatpZSVrVcpc9YQYgXwN6GhHaWIEJ6NncvBh7wmAzJ
         H9sQ48ixXGAfo/Q2UDnYd+dNa8VoakLuELlDt5OiPRRIXrN28LwCu06zLTbOSNO9SGE3
         dPQQ==
X-Gm-Message-State: APjAAAUwOjJ5peGhs629v4SAnpFIjQk8G5cJt5XU24DrOatzVGRtBa83
        5MwbTQCr1PeiT6XHXNkr7fKNXeCJcLjT6t5Obp9vkA==
X-Google-Smtp-Source: APXvYqw+7NMo8aDH8DPzxiviMSnHa6mPSv9NqIb9V8RGcxmjGuTqusV7aNOLUiisggfdETKdZxyD1mGc38XQIKfs0V0=
X-Received: by 2002:a05:6512:25b:: with SMTP id b27mr10395220lfo.60.1570224085049;
 Fri, 04 Oct 2019 14:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190923093637.27968-1-thierry.reding@gmail.com> <20190923095400.GA11084@ulmo>
In-Reply-To: <20190923095400.GA11084@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:21:12 +0200
Message-ID: <CACRpkdYFsSPtnx4a0uA3poK-7L_oh2mSkqPheug4hR7K3JO1jQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: Use of_device_get_match_data()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 23, 2019 at 11:54 AM Thierry Reding
<thierry.reding@gmail.com> wrote:

> Actually, scratch that. We can't do this because the match table is
> different for the legacy case from what the new PHY driver uses which
> calls this only for the legacy case. Instead, I'd propose the attached
> patch.

OK I applied that instead.

Yours,
Linus Walleij
