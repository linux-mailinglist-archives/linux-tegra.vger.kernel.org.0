Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA30438F1F9
	for <lists+linux-tegra@lfdr.de>; Mon, 24 May 2021 19:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbhEXRGq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 May 2021 13:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233175AbhEXRGq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 May 2021 13:06:46 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43713C061756
        for <linux-tegra@vger.kernel.org>; Mon, 24 May 2021 10:05:17 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id d14so505797ual.5
        for <linux-tegra@vger.kernel.org>; Mon, 24 May 2021 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eZESf2+UaWJEsGgPUeGFqkYRrVF4ir0zTy9O8j+JZj0=;
        b=F7m/3fCzNq2FjVowZE3b6kOUYNK0yc/QidlGDaLPRVfmD9v1gRRu7OVOrRBpTgyBAq
         RN6dpQp83jnaFaGvshIYnM+xXVDEAHcTxHRfUPB/SmG3IQsfVTPBnvWXIelgpaqEIIRp
         RbgRetkJQ+yYYTmV5IcLZ929/NeBfAGKyLUmXky1ShOLjOahGqBcLXtVlRg11DvEYpYd
         eIADl4LA6Dvl82BB+Ief4vDAB6PximvEmlgWhpWBcG4HyoBXvYyA9llRubapIvYM1pJi
         IwFJz0jr7NufaHk0RMW3QO5k29azEzEUM8yNELd2fPWiK5/1i9kbxxYnfWv9zDUII/Nj
         ggDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eZESf2+UaWJEsGgPUeGFqkYRrVF4ir0zTy9O8j+JZj0=;
        b=Epi6TcHeasyGsEdJo9GFtJSHGRZ5VpOr9Wh/anbD2N4v1RYSKvKOezaM0Ge7P+zshD
         r9QG8GqFBLkSJYYbBwVwuVQeEU/Frek7S2gnb2+VIFzvluuZnrLw5cwLHSAvOQEb8S/1
         0samo9g/edPVChEB3omCn8n6OzyYOFSa22cu6JmuGdIWvIY+w92kShRuvA6OEFhUjEcm
         kT5fPFw3C6SYOC7OQxb6dQKjrSMS4NRK6BxWcP1Y7aAa6PQrcPwMrWE8//v9Yhnw2kgH
         de/DLn85Swi6gfHjafwdimNbD76PZB6aJvSFSkXLqKWZXwQch/d4kNTUfN694Ik/MPv5
         LC2w==
X-Gm-Message-State: AOAM531KGJAhcgHHlGfI/wrZ1xLfL5lQCW7489jwBHvF7XhB7beDvvpY
        e6GTs53xmxz0dmiAOaeHL9vIW6Lrgj2LQl0+0bkAcw==
X-Google-Smtp-Source: ABdhPJwVnMsBxavUG6WhLD7276brAnw7avHoO4W5DwCb7iPsdb9pe0vuL7T8bKsnZFn6ouLaui6EqThOSbhN4pDxRHE=
X-Received: by 2002:ab0:d8f:: with SMTP id i15mr4749618uak.104.1621875916371;
 Mon, 24 May 2021 10:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210523231335.8238-1-digetx@gmail.com> <20210523231335.8238-14-digetx@gmail.com>
In-Reply-To: <20210523231335.8238-14-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 24 May 2021 19:04:40 +0200
Message-ID: <CAPDyKFrto2cosX3Ben_QWCYVqgeoF1Yv=8gEx4Y86WNyjeHvdg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] soc/tegra: pmc: Add core power domain
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        =?UTF-8?Q?Nikola_Milosavljevi=C4=87?= <mnidza@outlook.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 24 May 2021 at 01:13, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> NVIDIA Tegra SoCs have multiple power domains, each domain corresponds
> to an external SoC power rail. Core power domain covers vast majority of
> hardware blocks within a Tegra SoC. The voltage of a power domain should
> be set to a level which satisfies all devices within the power domain.
> Add support for the core power domain which controls voltage state of the
> domain. This allows us to support system-wide DVFS on Tegra20-210 SoCs.
> The PMC powergate domains now are sub-domains of the core domain, this
> requires device-tree updating, older DTBs are unaffected.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

[...]

> +
> +static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
> +{
> +       static struct lock_class_key tegra_core_domain_lock_class;
> +       struct generic_pm_domain *genpd;
> +       const char *rname = "core";
> +       int err;
> +
> +       genpd = devm_kzalloc(pmc->dev, sizeof(*genpd), GFP_KERNEL);
> +       if (!genpd)
> +               return -ENOMEM;
> +
> +       genpd->name = np->name;
> +       genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
> +       genpd->opp_to_performance_state = tegra_pmc_core_pd_opp_to_performance_state;
> +
> +       err = devm_pm_opp_set_regulators(pmc->dev, &rname, 1);
> +       if (err)
> +               return dev_err_probe(pmc->dev, err,
> +                                    "failed to set core OPP regulator\n");
> +
> +       err = pm_genpd_init(genpd, NULL, false);
> +       if (err) {
> +               dev_err(pmc->dev, "failed to init core genpd: %d\n", err);
> +               return err;
> +       }
> +
> +       /*
> +        * We have a "PMC pwrgate -> Core" hierarchy of the power domains
> +        * where PMC needs to resume and change performance (voltage) of the
> +        * Core domain from the PMC GENPD on/off callbacks, hence we need
> +        * to annotate the lock in order to remove confusion from the
> +        * lockdep checker when a nested access happens.
> +        */

Can you elaborate a bit more on this?

Are you saying that when the child domain (PMC pwrgate) gets powered
off, you want to drop its aggregated votes it may hold for the
performance state, as otherwise it may affect the parent domain (core
domain)?

I guess this would be a valid scenario to optimize for, especially if
you have more than one child domain of the core power domain, right?

If you have only one child domain, would it be sufficient to assign
->power_on|off() callbacks for the core domain and deal with the
performance stare votes from there instead?

> +       lockdep_set_class(&genpd->mlock, &tegra_core_domain_lock_class);
> +
> +       err = of_genpd_add_provider_simple(np, genpd);
> +       if (err) {
> +               dev_err(pmc->dev, "failed to add core genpd: %d\n", err);
> +               goto remove_genpd;
> +       }
> +
> +       return 0;
> +
> +remove_genpd:
> +       pm_genpd_remove(genpd);
> +
> +       return err;
> +}

[...]

> +static void tegra_pmc_sync_state(struct device *dev)
> +{
> +       int err;
> +
> +       pmc->core_domain_state_synced = true;
> +
> +       /* this is a no-op if core regulator isn't used */
> +       mutex_lock(&pmc->powergates_lock);
> +       err = dev_pm_opp_sync_regulators(dev);
> +       mutex_unlock(&pmc->powergates_lock);
> +
> +       if (err)
> +               dev_err(dev, "failed to sync regulators: %d\n", err);
> +}
> +

Nitpick.

Would you mind splitting the "sync_state" thingy out into a separate
patch on top of $subject patch?

I think it would be nice, especially since it shares a function via
include/soc/tegra/common.h - that would make it clear to what part
that belongs to.

>  static struct platform_driver tegra_pmc_driver = {
>         .driver = {
>                 .name = "tegra-pmc",
> @@ -3680,6 +3822,7 @@ static struct platform_driver tegra_pmc_driver = {
>  #if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
>                 .pm = &tegra_pmc_pm_ops,
>  #endif
> +               .sync_state = tegra_pmc_sync_state,
>         },
>         .probe = tegra_pmc_probe,
>  };
> diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
> index af41ad80ec21..135a6956a18c 100644
> --- a/include/soc/tegra/common.h
> +++ b/include/soc/tegra/common.h
> @@ -23,6 +23,8 @@ struct tegra_core_opp_params {
>  #ifdef CONFIG_ARCH_TEGRA
>  bool soc_is_tegra(void);
>
> +bool tegra_soc_core_domain_state_synced(void);
> +
>  int devm_tegra_core_dev_init_opp_table(struct device *dev,
>                                        struct tegra_core_opp_params *params);
>  #else
> @@ -31,6 +33,11 @@ static inline bool soc_is_tegra(void)
>         return false;
>  }
>
> +static inline bool tegra_soc_core_domain_state_synced(void)
> +{
> +       return false;
> +}
> +
>  static inline int
>  devm_tegra_core_dev_init_opp_table(struct device *dev,
>                                    struct tegra_core_opp_params *params)

Kind regards
Uffe
