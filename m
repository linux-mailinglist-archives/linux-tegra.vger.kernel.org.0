Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD3B44A00
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 19:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbfFMR5T (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 13:57:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36971 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfFMR5Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 13:57:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id 19so11467781pfa.4
        for <linux-tegra@vger.kernel.org>; Thu, 13 Jun 2019 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gvi3tZQZW8BsXnnoPHE7/tSt7BU9a4p0zFemEkayFyo=;
        b=shmyzcS6AFgiPB1nhEgk44jVk3eNLX1aARrmVE8OENnn2AdYUATUUhHlTAhUlHPT9N
         s/lHWDBDWqG4wkty37QJKxMJY52HNh/VqxdWLatdAJkMTa5UXOQq+auk8MDb7WfnJCph
         RBXBQWvtS7TP620qbvH8dboY1HcoiUfCaCD+/nUf8Ijak9HJH6ZWun3rBMGPqCcELBC8
         M0fOH0xqHHYJr7B02BEhWAiBxpKe/6j0jFEbw7an0lPa+hzJkp/1OS/zfYeqEbh+9FwZ
         PIg2SuPJvG3phhWpWqjU/l5NBjp1DblJiz7SC876wWMcun+HYZBUMC/D0Tevtq1r2hnn
         532w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gvi3tZQZW8BsXnnoPHE7/tSt7BU9a4p0zFemEkayFyo=;
        b=WHOBGiaKtUntgm3tXZDRkrUOpNPowLp7p4y7V3O2VBrkisy8MxhY3kWHthG+c5sV6d
         IfI4JDnj35BfGGgXqtp8Gc8wtaKzQDNj7T+K+tcLJIKk3rrpuNihY85uoGWFeG1tfoax
         g5XxsjYQSVl4I2mvaJ5SJmZgyDppNJazvvGtiNaQFbWOw3uccS6CKSc7zxxdF4O+KnPh
         khuD6SXRe29r2QNBeHcPgUxE//kLF77DkYu2ZKSQj2XJ5k3vcUYJp9C7Idtw4CbT4+KX
         A95EKGxdmIw/EQyEOXflvp0RCMnKIFCgwZfNXd/TR7IYvw+IhK3aZjAwOrvw8L4qJpdO
         agTQ==
X-Gm-Message-State: APjAAAWNBXEQavUaXejotQ1KCXbgiv+tvGkY8HBZT8+PbXYU66QrkZ1q
        U6cnnyr+4tSrKiSwt8bR3d6ilwKGnvBpDQC8Ih9WMf3Cqkc=
X-Google-Smtp-Source: APXvYqxAYGf2nyn7RvafyLmEaNLIwVZn1BvKVF8YLkER24Z2GCAQ/6zg6iVCPlW+tmtllrOtZf/RVm96bknxr8csHtM=
X-Received: by 2002:a63:1d5c:: with SMTP id d28mr31397596pgm.10.1560448635576;
 Thu, 13 Jun 2019 10:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190613172746.216819-1-nhuck@google.com>
In-Reply-To: <20190613172746.216819-1-nhuck@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 13 Jun 2019 10:57:04 -0700
Message-ID: <CAKwvOdn930hhHcnCA9arJ5=9SsT-6BfFC_1punmUZX2xWM-Hnw@mail.gmail.com>
Subject: Re: [PATCH] memory: tegra: Fix -Wunused-const-variable
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 13, 2019 at 10:28 AM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
> The only usage of this variable is from within an ifdef.
> It seems logical to move the variable into the ifdef as well.

Thanks for the patch, I agree but have the same thoughts as in:
https://lkml.org/lkml/2019/6/13/1438

> +#ifdef CONFIG_ARCH_TEGRA_124_SOC
>  static const unsigned long tegra124_mc_emem_regs[] = {
>         MC_EMEM_ARB_CFG,
>         MC_EMEM_ARB_OUTSTANDING_REQ,
> @@ -54,6 +55,7 @@ static const unsigned long tegra124_mc_emem_regs[] = {
>         MC_EMEM_ARB_MISC1,
>         MC_EMEM_ARB_RING1_THROTTLE
>  };
> +#endif
-- 
Thanks,
~Nick Desaulniers
